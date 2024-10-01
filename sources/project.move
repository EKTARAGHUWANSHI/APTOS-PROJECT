module MyModule::LoyaltyProgram {

    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    struct Customer has store, key {
        loyalty_points: u64, // Total loyalty points earned by the customer
    }

    /// Function to reward loyalty points to a customer.
    public fun reward_points(business: &signer, customer_addr: address, points: u64) {
        if (!exists<Customer>(customer_addr)) {
            let customer = Customer {
                loyalty_points: points,
            };
            move_to(business, customer);
        }
    }
}
