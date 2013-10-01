class SubscriptionsController < ApplicationController
    def new
        plan = Plan.find(params[:plan_id])
        @subscription = plan.subscriptions.build
        @subscription.user_id = current_user.id
    end
    
    def create
        @subscription = Subscription.new(params[:subscription])
        if @subscription.save
            redirect_to @subscription, :notice => "Thank you for subscribing!"
            else
            render :new
        end
    end
    
    def show
        @subscription = Subscription.find(params[:id])
    end
    
    def edit
        @subscription = Subscription.find(params[:id])
    end
    
    def update_card
        @subscription = current_user.subscriptions.first
        @subscription.stripe_card_token = params[:subscription][:stripe_card_token]
        if @subscription.save
        redirect_to @subscription, :notice => 'Updated card.'
        else
        flash.alert = 'Unable to update card.'
        render :edit
    end
    end
    
    def update_plan
        @subscription = current_user.subscriptions.first
        plan = Plan.find(params[:subscription][:plan_id]) unless params[:subscription][:plan_id].nil?
        if @subscription.update_plan(plan)
            redirect_to @subscription, :notice => 'Updated plan.'
            else
            flash.alert = 'Unable to update plan.'
            render :edit
        end
    end
end