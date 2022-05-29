




## Resources:


##### Tadeo Hepperle, 2022-05-28 11:21am:

Structure of Pages:
Splash:
    --> Splash if Appstartup not complete
    --> Login if no Auth
    --> Home if Auth
        --> Dashbaord

##### Tadeo Hepperle, 2022-05-28 01:34am:

Each Resource has a ResourceStatus: Unknown, Available, Failure

class ResourceRepository provides access to all resources, their status and their status as a stream.
- ResourceRepositoryImplIsolate1 in isolate 1
- ResourceRepositoryImplIsolate2 in isolate 2

from anywhere in isolate 1, we can for example call
```dart
getIt<ResourceRepositoryImplIsolate1>.foodData.status = EsnyaResourceStatus.available();
```
Because ResourceRepositoryImplIsolate1 listens to such changes, this will trigger an event sent to isolate 2, where the resource status is then mirrored and all listeners in isolate 2 are notified.


## TODO


TODO:

kcal and protein switch on tap  <CHECK>

correct amount of protein and kcal in list items <CHECK>


bucket title date: add kcal and protein in text <CHECK>


food item entry:
- computed property gram equivalent  <CHECK>

solve problem with everloading items 

header for dashboard

translation of amount:
- split maybe in head and tail, e.g. 1 apple (medium)
- make oneMedium -> ""
- fix rounding of even numbers, e.g. 4.0000 should be just 4


think about dynamic amountwidth in food item list item, so that aligned for each bucket


firebase only listen to changes, not all docs


add today bucket, as soon as app starts

firebase local caching offline



## The flow of input:

user input --> 
