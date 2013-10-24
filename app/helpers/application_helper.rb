module ApplicationHelper
    
    # Returns the full title on a per-page basis.
    def full_title(page_title)
        base_title = "Account Hero"
        if page_title.empty?
            base_title
            else
            "#{base_title} | #{page_title}"
        end
    end
    
    def currency(amount)
        number_to_currency(amount, unit: "&pound;", separator: ".", delimiter: ",")
    end
    
    def full_name(user)
        user.name[:first_name] + " " + user.name[:last_name]
    end
    
    def date_format(the_date)
        return the_date.strftime('%d/%m/%Y')
    end
    
    def expense_categories(user)
        user.expense_types.each do |et|
           @expense_cat ||= Array.new
           @expense_cat.push(et.expense_category_id).uniq
        end        
        @expense_cat
    end
end
