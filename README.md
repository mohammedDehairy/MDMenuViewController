MDMenuViewController
====================

 MDMenuViewController is an iOS container view controller that coordinates between its content view controllers through a side menu that is shown from the side with appealing animation , supports iOS 6.0 , 7.0 ,iPhone ,And iPad  , Customisable in almost every aspect ,provided with documentation ,And a demo app to get you going right away.
 
 
![alt tag](https://raw.github.com/mohammedDehairy/MDMenuViewController/master/MDMenuViewControllerscreenShot.gif)


---------------------------------------------------------------------------------------------------------------



installation

- just drag the "MDMenuViewController classes" folder to your project 



---------------------------------------------------------------------------------------------------------------



Basic How to


- prepare an NSArray of the content view Controllers
 
- each content view controller maintained by MDMenuViewController must conform to the protocol MDMenuViewCont             rollerDelegate And implementing two required methods
       

                 -(NSString*)titleForChildControllerMDMenuViewController:(MDMenuViewController*)menuController
                 
                 
which returns the title of the content view controller to be shown on the top bar and in the side menu




                 -(NSString*)iconForChildControllerMDMenuViewController:(MDMenuViewController*)menuController
                 
                 
                 
which returns the image name in the bundle you want to show for the content view controller beside its title             in side menu , if you wish  not to add an icon just return an empty string.

 and also declare a property 
       
       
 
                     @property(nonatomic,weak)MDMenuViewController *MenuController
                     
                     
                     

 alternatively make the content view controllers inherit from MDMenuChildViewController ,and override the                 MDMenuViewControllerDelegate methods
 


- instantiate MDMenuViewController with the initialisation method


                      - (id)initWithChildViewControllers:(NSArray*)viewControllers



and pass it the NSArray of the content view Controllers 



- show the MDMenuViewController instance.


 

- every top level content view controller can push other view controllers onto the stack like a                          UINavigationController like the following

                      [self.MenuController pushViewController:anotherViewController animated:YES];

you can also control the push transition animation , continue to see how .



- you can add a custom tob bar left button by implemeting the MDMenuViewControllerDelegate Method 
   
                     -(UIButton*)leftBarButtonForChildControllerMDMenuViewController:(MDMenuViewController *)menuController;

and return a cutom UIButton to replace the left top bar button when this content view controller is shown


---------------------------------------------------------------------------------------------------------------





Customisation


Customise the menu Button

- you can change the icon of the menu button like the following
            

                  [mdMenuControllerInstance.topBar.menuBtn setImage:[UIImage imageNamed:@"side_menu.png"]                                      forState:UIControlStateNormal];

                  [mdMenuControllerInstance.topBar.menuBtn setImage:[UIImage imageNamed:@"side_menu_active.png"]                                forState:UIControlStateHighlighted];



Customise the Back Button

- you can change the icon of the back button like the following

                 [mdMenuControllerInstance.topBar.backBtn setImage:[UIImage imageNamed:@"side_menu.png"]                                      forState:UIControlStateNormal];

                 [mdMenuControllerInstance.topBar.backBtn setImage:[UIImage imageNamed:@"side_menu_active.png"]                              forState:UIControlStateHighlighted];



Customise the top bar 


- the top bar is UIView sub class so you can control its appearance like any UIView 


Customise transition Animations

- MDMenuViewController has default animations for push and pop actions , you can make your own animations by declaring your own class that conform to the    protocol MDTransitionAnimatorProtocol with only one required method

                 -(void)transitionInView:(UIView*)containerView fromView:(UIView*)fromView toView:(UIView*)toView


       
Then to use your custom animator call this method when pushing viewControllers


                  [self.MenuController pushViewController:anotherController withTransitionAnimator:yourCustomAnimator];


In order to control pop animation just implement the MDMenuViewControllerDelegate method in your content View Controller 


                 -(void)topbarViewDidTapBackButton;


        
And in the implementation call 

                   [self.MenuController popViewControllerWithTransitionAnimator:youCustomAnimator];


      
In general you can show any viewController using the following method

                  [self.MenuController showViewController:viewController withTransitionAnimator:yourCustomAnimator];



Customise the side Menu

     
- the menu view is a UIView Sub class so it can be customised accordingly


- if you want full control over the content of the side menu view and how its shown , you can create your own menu view provided that it conforms to the  MDMenuViewProtocol or you can sub class the base MenuView class - the base MenuView class is not meant to be used on its own , its just meant to be sub classed -

then set your own custom MenuView to the menuView property of your MDMenuViewController instance

                      mdMenuControllerInstance.menuView = yourCustomMenuView;


  
