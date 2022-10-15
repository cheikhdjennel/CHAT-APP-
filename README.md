
# CHAT-APP-
*CHAT-APP is an iOS app developed using swift5 with both light and dark mode <b>to be able to chat with friends.</b> *
<p>-The app is intuitive and make it easy to connect with your friends</br>
-Design pattern used : MVC. </br>
-UI been developed programmatically and using storyboard.
<p/>

<h2> Pods used : </h2>
<li> *Firebase/Auth*: For authentication with email and password.
<li> *Firebase/Firestore*: to store users informations.
<li> *Firebase/Storage*: to store users profil pictures.
<li> CLTypingLabel :  For character by character typewriter animation in UILabel.

<h1>UI</h1>


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




<h2>1)-Login and Register screen using segmented control to switch : </h2>

<p>
<img width="270" hspace = "5" alt="Capture d’écran 2022-10-15 à 1 08 13 AM" src="https://user-images.githubusercontent.com/51541884/195984204-0e10a9d5-213f-4cf7-89cd-eecec96cfacc.png">
<img width="270" hspace = "5" alt="Capture d’écran 2022-10-15 à 1 08 28 AM" src="https://user-images.githubusercontent.com/51541884/195984212-09084f3e-cbd5-4349-a850-5fdf0359dc45.png">
<img width="270" alt="Capture d’écran 2022-10-15 à 1 08 47 AM" src="https://user-images.githubusercontent.com/51541884/195984214-da98fdde-f5f7-4110-8c99-279e82cfce7f.png">

</p>

<h3> Loading screen to wait for creation of the user or to login:</h3>

<img width="300" height = "450" align="middle" alt="Capture d’écran 2022-10-15 à 1 14 04 AM" src="https://user-images.githubusercontent.com/51541884/195984452-608edaab-6953-4841-9344-325c44230a32.png">



<h2>2)-Compeletion of registration.</h2>
<p>-Filling user informations and adding a profil picture choosen from Library or by taking a live picture, the image can be cropped(edited) and will be compressed</p>

<p float="left"  align="middle" >
<img width="340" hspace="30" alt="Capture d’écran 2022-10-15 à 1 11 44 AM" src="https://user-images.githubusercontent.com/51541884/195984226-929aa4b8-302c-42b9-822d-71e87a0db5b6.png">
<img width="341" alt="Capture d’écran 2022-10-15 à 1 12 06 AM" src="https://user-images.githubusercontent.com/51541884/195984249-ef9c1603-7448-4029-88a2-13d25c32cc6c.png">

</p>



<h3>Choosing the image from library of taking a live picture : </h3>

![Capture d’écran 2021-06-16 à 17 53 24](https://user-images.githubusercontent.com/51541884/122261893-b7f6ff00-cecc-11eb-9eac-37dded1d98fd.png)







<h2>3)-interface to show friends lists: </h2>

![friends lists _dark](https://user-images.githubusercontent.com/51541884/122592033-b1e35880-d05b-11eb-850a-1db545326a0a.png)
![friends lists _light](https://user-images.githubusercontent.com/51541884/122592039-b7d93980-d05b-11eb-992e-cae4b4e6e6b2.png)



<h2>4)-Message interface :</h2>
 By selecting a friend from the precedent interface to message him , we got this :
 
 ![Capture d’écran 2021-06-18 à 15 51 07](https://user-images.githubusercontent.com/51541884/122591813-65981880-d05b-11eb-9b17-7dc4572bf8be.png) ![Capture d’écran 2021-06-18 à 15 51 25](https://user-images.githubusercontent.com/51541884/122591847-75aff800-d05b-11eb-89e7-3b86fbf8b34f.png)


![Capture d’écran 2021-06-18 à 15 52 22](https://user-images.githubusercontent.com/51541884/122591855-78125200-d05b-11eb-965f-49cf9cb8530a.png) ![Capture d’écran 2021-06-18 à 15 52 38](https://user-images.githubusercontent.com/51541884/122591871-7c3e6f80-d05b-11eb-98b0-34e931573a2f.png)



<h2>5)-Let's try now to send a message : </h2>

![Capture d’écran 2021-06-18 à 15 58 36](https://user-images.githubusercontent.com/51541884/122591896-82cce700-d05b-11eb-8621-d43185cd6776.png)


<h3>The message will pop up in the conversation</h3>

![Capture d’écran 2021-06-18 à 15 58 51](https://user-images.githubusercontent.com/51541884/122591929-8ceee580-d05b-11eb-9b0b-124f9e2b5df4.png)


AND YEAH WE HAVE JUST FINISHED DEVELOPING THIS SIMPLE APP CHAAT , BUILT TO LEARN .










