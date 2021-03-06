*** Keywords ***
Setup
  Set Window Size  1200  800
  Set Selenium Timeout  10
  Set Selenium Speed  ${SPEED}

Go to IAM
  Open Browser  ${IAM_BASE_URL}  browser=${BROWSER}  remote_url=${REMOTE_URL}
  Setup

Go to Indigo dashboard
  Click Link  link=New Admin Dashboard

Click Back to Home
  Click Link  link=Back to Home Page
  
Click button with text  [Arguments]  ${text}
  Click Button  xpath=//button[text()='${text}']

Wait until modal overlay disappear
  Wait Until Page Does Not Contain Element  xpath=//div[@uib-modal-window='modal-window']
  Wait Until Page Does Not Contain Element  xpath=//div[@uib-modal-backdrop='modal-backdrop']

Click menu navigation entry  [Arguments]  ${entry}
  Wait Until Page Contains Element  xpath=//ul[@class='sidebar-menu']/li/a/span[text()='${entry}']
  Click Element  xpath=//ul[@class='sidebar-menu']/li/a/span[text()='${entry}']

Go to home page
  Click menu navigation entry  Home
  Wait until modal overlay disappear
  Wait Until Page Contains Element  userprofilepage

Go to users page
  Click menu navigation entry  Users
  Wait until modal overlay disappear
  Wait Until Page Contains  Created

Go to groups page
  Click menu navigation entry  Groups
  Wait until modal overlay disappear
  Wait Until Page Contains  Actions

Go to request management page
  Click menu navigation entry  Requests
  Wait until modal overlay disappear
  Wait Until Page Contains Element  requests-page

Go to user page  [Arguments]  ${name}
  Go to users page
  Find user in users page  ${name}
  Click Element  xpath=//*[@id='userslist']/tbody/tr/td/a[text()='${name}']
  Wait Until Page Contains  ${name} - Profile Page

Go to group page  [Arguments]  ${name}
  Go to groups page
  Find group in groups page  ${name}
  Click Element  xpath=//*[@id='groupslist']/tbody/tr/td/a[text()='${name}']
  Wait Until Page Contains  Members
