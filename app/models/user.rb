class User < ActiveRecord::Base
    attr_accessible :name, :email, :password, :password_confirmation, :business_type_id, :account_type, :address, :business_name, :business_start_date, :accounting_start_date, :next_step, :home_phone, :mobile, :default_year, :registered_selfemployed, :previous_accountant, :previous_accountant_address, :payment_history
    
    has_secure_password
    has_many :tax_returns, :dependent => :destroy
    has_many :employers, through: :tax_returns
    belongs_to :business_type
    has_many :expense_types, through: :business_type
    has_many :expenses
    has_many :students
    has_many :incomes, through: :students
    has_many :steps, through: :business_type
    has_many :subscriptions, :dependent => :destroy
    serialize :address, Hash
    serialize :previous_accountant_address, Hash
    serialize :payment_history
    
    before_save { |user| user.email = email.downcase }
    before_save { |user| user.name = name.titleize }
    before_save :create_remember_token
    
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence:   true,
    format:     { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }, :if => :password
    validates :password_confirmation, presence: true, :if => :password_confirmation
    
    def generate_token(column)
        begin
            self[column] = SecureRandom.urlsafe_base64
        end while User.exists?(column => self[column])
    end
    
    def payment_success(event)
        self.email = 'well@done88.com'
        self.payment_history ||= Array.new
        self.payment_history = self.payment_history.push({"amount" => event.data.object.lines.data[0].amount, "date" => event.data.object.date, "type" => event.type, "start" => event.data.object.period_start, "end" => event.data.object.period_end})
        self.save
    end
    
    private
    
    def create_remember_token
        self.remember_token = SecureRandom.urlsafe_base64
    end
end