
#En este codigo estuve como 3 o 4 horas porque no uso ruby usualmente y me empezo a doler la cabeza
#Aqui se define la clase stock donde se le da un nombre a la accion, porque asi es mas entretenido el ejercicio
class Stock
    attr_accessor :name
    def initialize(name)
        @name = name
    end
    #Aqui se simula la funcion de entrega de precio segun la fecha, la hice porque asi podia poner en funcionamiento todo el programa y eso es más entretenido que un codigo que funciona teoricamente.
    #por falicidad trabaje todo en float, pero internet recomendaban usar bigdecimal cuando se trabaja con cualquier cosa relacionada con dinero.
    def price(date)      
        return (rand 0..500).to_f
    end
end
#Aqui esta la clase protafolio pedida defini el atributo stocks para almacenar todas las acciones
class Portfolio
    attr_accessor :stocks
    def initialize(stocks)
        @stocks = stocks
    end
    # La clase profit tiene el bonus track pedido(o eso intente que tubiera jaja), y entrega un diccionario con la ganancia total y 
    # El rendimiento anual, segun la fecha introducida(aun que como esta planteado el problema da lo mismo que fecha se introdusca jajaj)
    def profit(inicial_date,final_date)
        spent_in_stocks = 0
        total_profit = 0
        for stock in @stocks do
            final_price = stock.price(final_date)
            inicial_price = stock.price(inicial_date)
            profit = final_price-inicial_price 
            total_profit += profit
            spent_in_stocks += inicial_price
        end
        annualized_return = (total_profit/spent_in_stocks)*100
        economic_data = {"profit" => total_profit, "annualized_return" => annualized_return}
        return economic_data
    end
end
#aqui le pongo los nombres a las acciones, ademas de crearlas (un poco fome los nombre, hubiera sido mas divertido con alguna libreria que generara nombres al azar jaaj, pero no la tengo instalada en el pc, pero algo es algo).
default_name = "accion_"
puts "cuantas acciones quiere generar?"
numero_acciones=gets
stocks = []
for i in 1..numero_acciones.to_i do
    name = default_name + i.to_s
    stocks.append(Stock.new(name))
end

# aqui creo el portafolio junto a dos fechas, ya que en el enunciado dijeron que deven ser fechas, ajaj aun que de todas maneras no afectan en nada en el programa
portfolio = Portfolio.new(stocks)
inicial_date = Time.new(2018, 1, 1)
final_date = Time.new(2018, 5, 1)
economic_data = portfolio.profit(inicial_date,final_date)
puts economic_data

