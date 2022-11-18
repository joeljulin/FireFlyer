# FireFlyer

Term project for CS1635 to declutter your news

### Team 6 Links

- [Google Drive](https://drive.google.com/drive/folders/1P3JNR3AlcwgA3WZO7-aKBEHoTynFPju5)
- [Figma](https://www.figma.com/file/ukjWyvm9vJH9xTKtB6TqWP/Wireframes-and-Storyboards)

## Software Execution Steps
> How to start the app (MacOS):

1) Clone repository.

2) Double-check you are in the `/FireFlyer` directory.

3) Run below CLI commands
```bash
$ open -a Simulator
$ flutter run
```

## Deliverable Log:
### [Deliverable 1 - Design](https://docs.google.com/presentation/d/1PBJw8vFo9YYl-iNGUJwGbq65XRKv4IeTb5cCl_9_8xE/edit)
### [Deliverable 2 - Software Architecture](https://docs.google.com/presentation/d/14dUAkKqEUebL-GGyOehulQIBPagsTQggjOoJAVR_T5o/edit)
### [Deliverable 3 - Demo](https://docs.google.com/document/d/1FcSzP95tMeEMsP4t9CxyH832Tk8IxjKcvtBR4On8uVc/edit)

### Deliverable 3 - Summarized
Tasks Completed:
- [x] Login: two input fields (email, password), and buttons for creating an account, password recovery, and form submission (for signing in). 
- [x] Home: resume reading header and article categories implemented via an article carousel with entire page scrolling ability.
- [x] Search: search bar in appbar and the same article categories as implemented on the home page via an article carousel with entire page scrolling ability.
- [x] Profile: page header in appbar, the favorites article category presented via an article carousel, and a sign out button that redirects to the login page
- [x] Routing between views via a bottom navigation bar
- [x] Design System Implementation (Figma -> Code)

Task Execution Steps:
> To execute the completed tasks, do the following steps.
1) Follow the software execution steps to launch our application
2) You are first presented with the login page, where you can click the login button to be sent to the home page.
3) At the home page, you will see various categories displayed such as editor’s picks, most read, and trending. You are able to scroll through the editor’s picks section to see how our article carousel works.
4) Select the search icon in the bottom navigation to be sent to the search page. A search bar appears at the top of the page and it carries over the categories from the home page.
5) Select the profile icon in the bottom navigation to be sent to the profile page. There is a button at the bottom to sign out which will return you to the login page. 


The tasks we still need to complete are the following…
- [ ] User and Article Database implementation (Model)
This will store our user profiles and user data so we can display user specific categories
- [ ] The logic behind viewing an article (Presenter)
This will allow us to keep track of user history and populate user specific categories such as here’s what you missed and favorites
- [ ] Searching functionality that will find articles by title in our database
  This will require our article database to be implemented
- [ ] Resuming your most recently read article if not completed and a working progress bar to indicate how far along in the article you are
   Article previews when the article icon is clicked on
- [ ] A login page that will verify email and passwords before logging the user in as well as the option to create a new account if not currently registered


