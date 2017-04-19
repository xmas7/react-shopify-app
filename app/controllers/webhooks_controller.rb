class WebhooksController < ApplicationController
  def create
    shop = Shop.find_by(shopify_domain: params[:myshopify_domain])
    user = User.shopify.find_by(shop_id: shop.id)

    Analytics.track({
        user_id: user.id,
        event: 'Uninstalled Shopify app',
        properties: {
            plus: user.is_plus?
        }
    })

    user.update(plus: false)
  end
end
