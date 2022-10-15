
# CHAT-APP-
<b>CHAT-APP is an iOS app developed using swift5 with both light and dark mode <b>to be able to chat with friends.</b> </b>
<p>-The app is intuitive and make it easy to connect with your friends.</br>
-Design pattern used : MVC. </br>
-UI been developed programmatically and using storyboard.
<p/>

<h2> Pods used : </h2>
<li> Firebase/Auth: For authentication with email and password.
<li> Firebase/Firestore: to store users informations.
<li> Firebase/Storage: to store users profil pictures.
<li> CLTypingLabel :  For character by character typewriter animation in UILabel.


<h1> App functionalities : </h1>
<ul>
<li> Create user using email, password and username.
<li> Login with an existing user.
<li> Complete registration by storing users infos.
<li> Adding a user profil picture and compressing it before storing it in firebase storage.
<li> Chat with someone.
<li> Search for someone.
<li> Log out.
</ul>
 
 
 
<h1>UI</h1>

 
<h2>1)-Login and Register screen using segmented control to switch: </h2>
<p>
<img width="270" hspace = "5" alt="Capture d’écran 2022-10-15 à 1 08 13 AM" src="https://user-images.githubusercontent.com/51541884/195984204-0e10a9d5-213f-4cf7-89cd-eecec96cfacc.png">
<img width="270" hspace = "5" alt="Capture d’écran 2022-10-15 à 1 08 28 AM" src="https://user-images.githubusercontent.com/51541884/195984212-09084f3e-cbd5-4349-a850-5fdf0359dc45.png">
<img width="270" alt="Capture d’écran 2022-10-15 à 1 08 47 AM" src="https://user-images.githubusercontent.com/51541884/195984214-da98fdde-f5f7-4110-8c99-279e82cfce7f.png">

</p>

<h3>1.1-Loading screen to wait for the creation of the user or to login: </h3>
<p align="middle">
<img width="300" height = "600" alt="Capture d’écran 2022-10-15 à 1 14 04 AM" src="https://user-images.githubusercontent.com/51541884/195984452-608edaab-6953-4841-9344-325c44230a32.png">
</p>


 
<h2>2)-Compeletion of registration screen: </h2>
<p>-Filling user informations and adding a profil picture choosen from Library or by taking a live picture, the image can be cropped(edited) and will be compressed</p>

<p float="left"  align="middle" >
<img width="340" hspace="30" alt="Capture d’écran 2022-10-15 à 1 11 44 AM" src="https://user-images.githubusercontent.com/51541884/195984226-929aa4b8-302c-42b9-822d-71e87a0db5b6.png">
<img width="340" alt="Capture d’écran 2022-10-15 à 1 12 06 AM" src="https://user-images.githubusercontent.com/51541884/195984249-ef9c1603-7448-4029-88a2-13d25c32cc6c.png">

</p>



<h2>3)-Show Friends list screen: </h2>
<p>-Contains two states loading and success state, a loading shimmer is displayed at first before the retreival of the friends list.</p>
<p float="left"  align="middle" >
<img width="340" hspace="30" alt="Capture d’écran 2022-10-15 à 1 23 47 AM" src="https://user-images.githubusercontent.com/51541884/195984740-ab38c742-59be-4e95-85bf-92f9a7a5f0eb.png">
<img width="340" alt="Capture d’écran 2022-10-15 à 1 30 05 AM" src="https://user-images.githubusercontent.com/51541884/195984748-7a7ba23b-9400-49fa-916f-b8e35444640f.png">

</p>


<h2>4)-Discussion screen:</h2>
<p>-By selecting a friend from the precedent interface to message him, we get this : </p>
 
<p float="left"  align="middle" >
<img width="338" alt="1-1" hspace="30" src="https://user-images.githubusercontent.com/51541884/195985297-51ac9af1-de11-4a7c-a97c-3cc4fc2f9b72.png">
<img width="335" alt="2-2" src="https://user-images.githubusercontent.com/51541884/195985303-6e4e13f5-b415-4336-8dff-e0624c605968.png"> 
</p>
</br> 
<p float="left"  align="middle" >
<img width="338" alt="3-3" hspace="30" src="https://user-images.githubusercontent.com/51541884/195985312-eff7f2bf-54c7-421e-bfc8-234e4ffbcb0a.png">
<img width="336" alt="4-4" src="https://user-images.githubusercontent.com/51541884/195985317-2200dac0-0430-4def-8f22-035994cc534d.png">
</p>


<h2>5)-Let's try now to send a message: </h2>
<p float="left"  align="middle" >
<img width="341" alt="5-5" src="https://user-images.githubusercontent.com/51541884/195985320-0b401538-c81c-4cc3-887a-843f974c0119.png">
</p>

<h3>The message will pop up in the conversation</h3>
<p float="left"  align="middle" >
<img width="335" alt="6-6" src="https://user-images.githubusercontent.com/51541884/195985333-0abf45c6-881d-4843-8b61-baf6d96e168d.png">
</p>

AND YEAH WE HAVE JUST FINISHED DEVELOPING THIS SIMPLE CHAT APP...










