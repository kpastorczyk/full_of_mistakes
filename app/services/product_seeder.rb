class ProductSeeder
  cattr_accessor :category
  def initialize(category = nil)
    @@category = category
  end

  def seed
    if @@category == 'Guitars' || @@category.nil?
      Product.create!(
        name: "Fender Stratocaster",
        category: "Guitars",
        price: 1234.21,
        secret_code: 'secret code 123',
      )

      Product.create!(
        name: "Gibson Les Paul 1968",
        category: "Guitars",
        price: 2345.21,
        secret_code: 'secret code 234',
      )

      Product.create!(
        name: "PRS S2 Custom 22",
        category: "Guitrs",
        price: 545.21,
        secret_code: 'secret code 456',
      )
    end

    if @@category == 'Grocery' || @@category.nil?
      Product.create!(
        name: "Milk 2% 1L - (Mlekowita)",
        category: "Grocery",
        price: 0.89,
        secret_code: 'secret code 543',
      )

      Product.create!(
        name: "Milk 2% 1L - (Łaciate)",
        category: "Grocery",
        price: 0.91,
        secret_code: 'secret code 1112',
      )

      Product.create!(
        name: "Butter 250g",
        category: "Grocery",
        price: 1.59,
        secret_code: 'secret code 676',
      )
    end

    if @@category == 'Cars' || @@category.nil?
      Product.create!(
        name: "Ford Mustang",
        category: "Cars",
        price: 100000.89,
        secret_code: 'code 543',
      )

      Product.create!(
        name: "Porsche 911",
        category: "Cars",
        price: 100000.89,
        secret_code: 'code 1112',
      )
    end
    true
  end
end
