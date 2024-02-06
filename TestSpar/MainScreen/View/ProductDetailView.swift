//
//  ProductDetailView.swift
//  TestSpar
//
//  Created by Александра Тажибай on 06.02.2024.
//

import SwiftUI

struct ProductDetailView: View {
    @EnvironmentObject var vm: MainViewVM
    @Environment(\.dismiss) var dismiss
    
    var totalPrice: Double {
        return Double(vm.quantity) * product.price
    }
    
    let product: Product
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                //Изображение и тайтл
                Group {
                    Image(product.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 350)
                        .overlay(alignment: .topLeading) {
                            if product.isDiscount {
                                Text("Цена по карте")
                                    .foregroundStyle(.white)
                                    .padding(5)
                                    .background(.accent)
                                    .cornerRadius(5)
                            }
                        }
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(product.reviews.raiting.description)
                        Text("|")
                        Text(product.reviews.count.description + " отзывов")
                        Spacer()
                        if product.isDiscount {
                            Text("-" + product.discount.description + "%")
                                .foregroundStyle(.white)
                                .padding(.horizontal)
                                .background(Color.red)
                        }
                    }
                    
                    Text(product.name + " " + product.weight.description + " г")
                        .font(.largeTitle.bold())
                    
                    //Страна
                    HStack {
                        Image(product.countryImage)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                        Text(product.country)
                        Spacer()
                    }
                }
                .padding(.horizontal)
                
                
                //Описание
                Group {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Описание")
                                .font(.subheadline.bold())
                            Spacer()
                        }
                        Text(product.description)
                    }
                    
                    //Основные характеристики
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Основные характеристики")
                                .font(.subheadline.bold())
                            Spacer()
                        }
                        
                        HStack(alignment: .top) {
                            Text("Производство")
                            Text(".......................")
                                .foregroundStyle(.gray)
                            Spacer()
                            
                            Text(product.characteristics.production)
                                .multilineTextAlignment(.trailing)
                                .lineLimit(2)
                        }
                        .font(.footnote)
                        
                        HStack(alignment: .top) {
                            Text("Энергетическая ценность, ккал/100г")
                            Spacer()
                            Text(".......................")
                                .foregroundStyle(.gray)
                            Spacer()
                            
                            Text("\(product.characteristics.energyValue[0]) ккал, \(product.characteristics.energyValue[1]) кДж")
                                .multilineTextAlignment(.trailing)
                                .lineLimit(2)
                        }
                        .font(.footnote)
                        
                        HStack(alignment: .top) {
                            Text("Жиры/100г")
                            Spacer()
                            Text("........................................................")
                                .foregroundStyle(.gray)
                            Spacer()
                            
                            Text(String(format: "%.1fг", product.characteristics.fats))
                                .multilineTextAlignment(.trailing)
                        }
                        .font(.footnote)
                        
                        HStack(alignment: .top) {
                            Text("Белки/100г")
                            Spacer()
                            Text("........................................................")
                                .foregroundStyle(.gray)
                            Spacer()
                            
                            Text(String(format: "%.1fг", product.characteristics.squirrels))
                                .multilineTextAlignment(.trailing)
                        }
                        .font(.footnote)
                        
                        HStack(alignment: .top) {
                            Text("Углеводы/100г")
                            Spacer()
                            Text("........................................................")
                                .foregroundStyle(.gray)
                            Spacer()
                            Text(String(format: "%.1fг", product.characteristics.carbohydrates))
                                .multilineTextAlignment(.trailing)
                        }
                        .font(.footnote)
                    }
                    
                    NavigationLink {
                        //view
                    } label: {
                        Text("Все характеристики")
                            .bold()
                    }
                }
                .padding(.horizontal)
                
                
                //Отзывы
                Group {
                    HStack {
                        Text("Отзывы")
                            .font(.title3).bold()
                        Spacer()
                        NavigationLink {
                            
                        } label: {
                            Text("Все \(product.reviews.count.description)")
                        }
                        .font(.subheadline).bold()
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(product.reviews.review) { review in
                                ReviewRow(review: review)
                            }
                            .padding(.horizontal, 5)
                        }
                        .padding(.vertical)
                        .padding(.horizontal)
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Оставить отзыв")
                            .bold()
                            .padding(.vertical, 7)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(lineWidth: 2)
                            )
                    }
                    .padding(.horizontal)
                }
                
                //Покупка
                Group {
                    Picker(selection: $vm.selectedUnitIndex, label: Text("")) {
                        Text("шт").tag(0)
                        Text("кг").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    HStack {
                        VStack(alignment: .leading) {
                            HStack(spacing: 0) {
                                Text(product.price.description)
                                    .bold()
                                    .font(.largeTitle)
                                PriceFractionRow()
                            }
                            
                            Text(product.oldPrice.description)
                                .foregroundStyle(.gray)
                                .strikethrough()
                                .font(.subheadline)
                        }
                        
                        Spacer()
                        
                        HStack {
                            Button(action: {
                                if vm.quantity > 0 {
                                    vm.quantity -= 1
                                }
                            }) {
                                Text("-")
                            }
                            Spacer()
                            VStack {
                                Text("\(vm.quantity) \(vm.selectedUnitIndex == 0 ? "шт" : "кг")")
                                Text(totalPrice.description + "р")
                                    .font(.caption)
                            }
                            Spacer()
                            Button(action: {
                                vm.quantity += 1
                            }) {
                                Text("+")
                            }
                        }
                        .frame(width: 120)
                        .frame(height: 15)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(20)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.top, 20)
        }
        .navigationBarBackButtonHidden()
        //TODO: - Вынести тулбар в экстеншн
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "arrow.left")
                }
            }
            
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button(action: {

                }) {
                    Image(systemName: "doc.plaintext")
                }
                
                Button(action: {
                    
                }) {
                    Image(systemName: "square.and.arrow.up")
                }
                
                Button(action: {

                }) {
                    Image(systemName: "heart")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ProductDetailView(product: Product.mockData()[0])
            .environmentObject(MainViewVM())
    }
}


extension View {
    //        .toolbarDetailView()
    func toolbarDetailView() -> some View {
        self.toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    
                }) {
                    Image(systemName: "arrow.left")
                }
            }
            
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button(action: {

                }) {
                    Image(systemName: "doc.plaintext")
                }
                
                Button(action: {

                }) {
                    Image(systemName: "square.and.arrow.up")
                }
                
                Button(action: {

                }) {
                    Image(systemName: "heart")
                }
            }
        }
    }
}
