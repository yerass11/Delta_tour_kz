# Delta Tour KZ 

<div style="display: flex; align-items: center; justify-content: space-between;">
    <div style="flex: 1;">
        Delta Tour KZ is a SwiftUI-based application designed to simplify visa application processes. The app provides users with the ability to browse visa requirements, fill out forms, and track their applications, all with an intuitive and user-friendly interface.
    </div>
    <div>
        <img src="assets/App_Icon.jpg" alt="App Icon" width="200" height="200">
    </div>
</div>


## Features
- **Visa Application Forms:** Easy-to-use forms for submitting visa applications.
- **Country Information:** Browse and retrieve visa requirements for supported countries.
- **Dynamic UI:** Reactive SwiftUI views for a seamless user experience.
- **Navigation:** Simple and intuitive navigation between application steps.

---

## Technologies Used
- **SwiftUI:** For building the user interface.
- **Combine:** For state management and data binding.
- **Networking:** `URLSession` for API communication.
- **Dependency Injection:** Ensuring testability and modularity.
- **Persistence:** UserDefaults (optional, for storing user preferences).


---

## Architectures and Design Patterns

### MVVM (Model-View-ViewModel)
The project follows the **MVVM** architecture to separate business logic from UI, ensuring maintainability and scalability.
- **Model:** Represents the core data structures, such as visa application details and country information.
- **ViewModel:** Manages state and business logic, including form validation and API calls, and exposes data to the views using `@Published` properties.
- **View:** SwiftUI views dynamically bind to the ViewModel using declarative data bindings.

#### Example:
```swift
struct VisaApplicationView: View {
    @StateObject var viewModel = VisaApplicationViewModel()

    var body: some View {
        VStack {
            TextField("Enter Name", text: $viewModel.userName)
            Text(viewModel.statusMessage)
        }
        .onAppear {
            viewModel.fetchVisaRequirements()
        }
    }
}
```

---

### State Management
SwiftUI's state-driven updates were implemented using the following:
- **@State:** For managing local state within views.
- **@ObservedObject and @StateObject:** For observing changes in the ViewModel.
- **@Binding:** For propagating state between parent and child views.

---

### Networking Layer
The app includes a dedicated networking layer for fetching data from APIs, ensuring separation of concerns and reusability.

#### Example:
```swift
class VisaService {
    func fetchCountries(completion: @escaping ([Country]) -> Void) {
        // Networking logic to retrieve countries
    }
}
```

---

### Dependency Injection
To enhance testability and modularity, dependencies like services are injected into the ViewModels.

#### Example:
```swift
class VisaApplicationViewModel: ObservableObject {
    private let service: VisaService

    init(service: VisaService = VisaService()) {
        self.service = service
    }
}
```

---

### Navigation and Routing
The app utilizes **NavigationStack** for transitioning between screens seamlessly.

#### Example:
```swift
NavigationStack {
    NavigationLink("Apply for Visa", destination: VisaFormView())
}
```

---

## Setup and Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yerass11/Delta_tour_kz.git
   ```
2. Open the project in Xcode:
   ```bash
   cd Delta_tour_kz
   open Delta_tour_kz.xcodeproj
   ```
3. Build and run the project on a simulator or connected device.

## Challenges and Solutions

- **Image Optimization**: Learned and implemented strategies for managing images efficiently without increasing memory usage.

## Lessons Learned

- Enhanced understanding of SwiftUI’s capabilities and limitations.
- Improved debugging skills while addressing issues like navigation title behavior.
- Gained insights into effective memory management in iOS development.

## Future Improvements

- **Localization**: Add support for multiple languages to cater to a diverse user base.
- **Advanced Features**: Incorporate additional functionalities like document scanning and status tracking.
- **Testing**: Implement unit and UI tests to ensure app stability and reliability.

## Acknowledgements

This project was made possible with the support and resources from the visa center, as well as insights gained from various coding discussions and queries.

## Author

Developed by [yerass11](https://github.com/yerass11). Feel free to contribute or provide feedback to enhance the app further.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.




