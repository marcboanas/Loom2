class PaymentsController < ApplicationController
    def update_card
        @subscriptionCard = current_user.subscriptions.first
        @subscriptionCard.stripe_card_token = params[:subscription][:stripe_card_token]
        if @subscriptionCard.save
            redirect_to @subscriptionCard, :notice => 'Updated card.'
            else
            flash.alert = 'Unable to update card.'
            render :edit
        end
    end
end
