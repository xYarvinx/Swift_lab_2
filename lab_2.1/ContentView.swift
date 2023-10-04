import SwiftUI

struct ContentView: View {
    @State private var celsiusInput = ""
    @State private var fahrenheitOutput = ""
    @State private var isEnglish = true
    @FocusState private var focusedField: Bool
    
    let Vibration = AppVibration.Vibration.self;
    
    var buttonText: String {
        return isEnglish ? "Convert!" : "Преобразовать!"
    }
    
    var temperatureLabelText: String {
        return isEnglish ? "Temperature in Celsius" : "Температура в градусах Цельсия"
    }
    
    var fahrenheitLabelText: String {
        return isEnglish ? "Temperature in Fahrenheit: \(fahrenheitOutput)" : "Температура в градусах Фаренгейта: \(fahrenheitOutput)"
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button(action: {
                    isEnglish = !isEnglish
                    Vibration.light.vibrate()
                    })
                { Image(systemName: "globe")
                            .imageScale(.large)
                            .foregroundColor(.primary)
                            }
                            .padding()
                        }
            Spacer()
            
            Text(temperatureLabelText)
            
            TextField(isEnglish ? "Enter celsius" : "Введите Цельсия", text: $celsiusInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                    .border(Color.primary)
                    .frame(width: 270.0)
                    .multilineTextAlignment(.center)
                    .keyboardType(.decimalPad)
                    .focused($focusedField)
                
            
            Spacer()
                .frame(height: 100)
            
            Button(action: {
                convert()
                Vibration.success.vibrate()
                focusedField = false;
            }) {
                Text(buttonText)
                    .padding(.horizontal, 80)
                    .padding(.vertical, 20)
                    .frame(width: 290)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
                    .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .stroke(Color.primary)
                )
            }
            
            Text(fahrenheitLabelText)
                .padding()
            
            Spacer()
        }
    }
    
    func convert() {
        celsiusInput.replace("," , with: ".")
        if let celsius = Double(celsiusInput) {
            let fahrenheit = (celsius * 9 / 5) + 32
            fahrenheitOutput = String(format: "%.2f", fahrenheit)
        } else {
            fahrenheitOutput = isEnglish ? "Error input!" : "Ошибка ввода!"
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
