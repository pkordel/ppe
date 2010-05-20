USAGE
=====

1. Setup application

        cp config/database.yml.example config/database.yml
        rake db:bootstrap
  
    Go ahead and load sample data

    Fire it up to see that it works

    Shut it down


2. Configure PPE

    You'll need to have a Paypal developer account (developer.paypal.com) and both buyer and seller test accounts.
  
    Tip: these are sandbox only, so use email addresses and passwords that are easy to  remember, e.g. buyer@example.com and seller@example.com.
  
    Your sandbox credentials are available from the API Credentials link.
  
    Start your app
  
        http://localhost:3000/admin/payment_methods/new
  
    Name: Paypal Express
  
    Environment: Development
  
    Active: Yes
  
    Provider: BillingIntegration::PaypalExpress
  
    Create
  
    Now add your credentials in the screen that follows
  
    review: unchecked [1]
  
    Signature: signature from your paypal seller test account
  
    Server: test
  
    Test Mode: checked
  
    Password: API Password from your paypal seller test account
  
    Login: API Username from your paypal seller test account
  
    Update

3. Test it

    Add an item to cart
  
    Check out
  
    Address step: complete it using a valid US address. (Use Sean Schofield's from the railsdog site ;))
  
    Delivery step: pick anything
  
    Payment step: pick Paypal Express. If this does not show up as an option, repeat Step 3. 
  
    The Check out with PayPal button should appear.
  
    Make sure you're logged into your paypal developer account in another browser window before clicking it, as you'll be redirected to your test account (same browser, new window or tab).
  
    On Paypal's site (your previously configured Seller test account), log in as the Buyer. 
  
    If you set up a test buyer account as buyer@example.com previously, use this now.
  
    You should now see the paypal order details screen with a Pay Now button.
  
    Click Pay Now
  
    You should now see the spree apps thank you for your order page
  

4. Check the payment

        http://localhost:3000/admin/orders
  
    Edit your new order
  
    Go to the Payments section from the right hand menu
  
    Pending Payments should show Paypal Express with the options of Show and Capture
  
    Click Show and look over the info available
  
    The payment has status Pending with a successful authorization
  
    Back to Payments
  
    This time click Capture, then OK
  
    Click Show to see what's changed. 
  
    You should now see two transactions, the previous Authorize transaction and a new Capture one with status Completed
  

If you want to automatically capture payments, see site_extension.rb in vendor/extensions/site.

That's it.
I did this with a clean app from spree gem 0.10.2 and the official railsdog ppe extension.
There are probably more modifications you may want to perform, the intent here is just to get you going.

I am available for consultant work btw :)

Any other problems you may run into are not related to either spree or railsdog's ppe extension.

What I found writing this:

- missing translations in the admin backend and on the Confirm screen when review is set to true

- again, as mentioned in other threads here, the Save and Continue button should disappear when Check out with PayPal button appears. Alternatively, Save and Continue should do the same thing as the PPE button if this payment method is selected.

Hope this helps,
Peter Kordel

[1] If you check the review checkbox in the admin section for Payment Methods/Paypal Express, the flow is slightly different. Instead of Pay Now on Paypal's order details page, it now says Continue. And the user is directed back to the spree app's Confirmation page showing a place order button. Use whichever suits your needs best. Personally, I leave review unchecked to cut down on the steps in the checkout flow.
