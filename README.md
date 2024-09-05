# Ila Bank Task
This repository contains the source code for a Financial Services app, implemented using two different approaches in two separate branches:

### 1.Main Branch: 
Contains the implementation using UIKit and a single UICollectionView with a Compositional Layout.
### 2.IlaBankTaskSwiftUI Branch: 
Contains the implementation using SwiftUI, following a task given for an Ila Bank project.

## Branches Overview
### Main Branch
The main branch focuses on implementing a financial services app using UIKit. This branch includes the following key features:

- **UICollectionView with Compositional Layout:** The app uses a single UICollectionView with a Compositional Layout to manage different sections, including a carousel and a list view.
- **Dynamic Content Handling:** The app efficiently reloads data and updates specific sections without affecting others. This is useful in scenarios like updating search results without reloading headers or footers.
- **UIPageControl Integration:** The carousel section is integrated with a UIPageControl, dynamically updating based on the visible items in the collection view.
- **Advanced Debugging:** This branch contains robust debugging code to identify and handle issues related to batch updates and data inconsistencies in the collection view.

### IlaBankTaskSwiftUI Branch
The ilaBankTask branch is focused on implementing the same task using SwiftUI. This branch includes:

- **SwiftUI Implementation:** A SwiftUI-based approach to building the financial services app, replacing UIKit with modern declarative UI elements.
- **MVVM Architecture:** The SwiftUI version adheres to the MVVM (Model-View-ViewModel) architecture, making the code more modular and easier to maintain.
- **Data Binding and Dynamic Views:** The use of @State, @Binding, and other SwiftUI state management techniques to handle dynamic data updates and view rendering.
- **Custom UI Components:** Custom SwiftUI components for displaying carousel items, lists, and other UI elements.
- **Task-Specific Adjustments:** This branch includes specific adjustments and enhancements for the Ila Bank project, such as handling JSON data with financial services categories and dynamically determining the number of sections in the view.

## Setup and Installation
1. Clone the repository:
```
git clone https://github.com/your-username/your-repo.git
cd your-repo
```
2. Checkout the desired branch:

	**- For the UIKit implementation:**
	```
	git checkout main
	```
	**- For the SwiftUI implementation:**
	```
	git checkout ilaBankTask
	```
3. Build and run the app on your simulator or device.

