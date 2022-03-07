# Q&A List

# Overview 

The app is responsible for representing Q&A on Stackoverflow and shows the question's owner and the link of the question.
Also the user can save any Question during preview the details.

Pages of the app :

- Q&A List : Get list from API .

- Fliter Page : API that filter using minimum and tag parameters.

-  Owner Details: Get in deep and make a bigger view about the question and it's owner and save the question in the Saved Questions page.

- Saved Questions Page: Show and delete the Questions which are saved by the user from Owner Details.

 # Libraries Used 
 
 - CoreData : Using Persistance to save Questions data to reuse it later ( DataModel file)
 - Dependancy injection: Injecting *Data Controller.swift*  class by composing it to each needed class we use Coredata to achieve Loose Coupling.
 - 
 
# Tools Versions

- Xcode : Version 13.0 
- Swift : 5.0
- iOS : 15.0

# Screenshots:
  - Q&A List & Owner Details
  

https://user-images.githubusercontent.com/19348335/157052830-cc86015a-b559-4981-b9ea-72a4db7e5f0d.mov

- Saving the question and Deleting it


https://user-images.githubusercontent.com/19348335/157053228-a5bf26db-51fe-443a-88f7-c4c0008bb0ce.mov

