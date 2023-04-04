namespace :basket_filling  do
  desc "Adding apples to baskets "
  task :add_apple_to_basket, [:variety, :count] => [:environment] do |task, args|
    
    baskets = [].concat( Basket.where("fill_rate::real = 0 OR fill_rate IS NULL") )
    
    baskets = baskets.concat(Basket.left_joins(:apples).where("fill_rate::real < 100")
                                   .where(apples: {variety: 'simla1'}))
            
    if baskets.empty?
      puts "All baskets are full. We couldn't find the place for #{args[:count]} apple(s)"
      next
    end

    no_of_apples_left = args[:count].to_i 
    baskets.each do |basket|
      while(basket.fill_rate.to_f < 100 && no_of_apples_left > 0)
        basket.apples.create(variety: args[:variety])
        no_of_apples_left -= 1
        basket.update(fill_rate: (basket.apples.count.to_f/basket.capacity) * 100)
      end
    end
    
    if no_of_apples_left > 0
      puts "All baskets are full. We couldn't find the place for #{no_of_apples_left} apples"
    else
      puts "All apples are placed"
    end

  end
end
