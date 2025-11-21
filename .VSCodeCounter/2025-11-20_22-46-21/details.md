# Details

Date : 2025-11-20 22:46:21

Directory e:\\WYH\\RailwaySystem

Total : 85 files,  10190 codes, 1077 comments, 1428 blanks, all 12695 lines

[Summary](results.md) / Details / [Diff Summary](diff.md) / [Diff Details](diff-details.md)

## Files
| filename | language | code | comment | blank | total |
| :--- | :--- | ---: | ---: | ---: | ---: |
| [CMakeLists.txt](/CMakeLists.txt) | CMake | 59 | 0 | 12 | 71 |
| [README.md](/README.md) | Markdown | 18 | 0 | 0 | 18 |
| [accountmanager.cpp](/accountmanager.cpp) | C++ | 250 | 1 | 23 | 274 |
| [accountmanager.h](/accountmanager.h) | C++ | 35 | 6 | 9 | 50 |
| [admin.cpp](/admin.cpp) | C++ | 56 | 0 | 14 | 70 |
| [admin.h](/admin.h) | C++ | 25 | 0 | 5 | 30 |
| [bookingsystem.cpp](/bookingsystem.cpp) | C++ | 185 | 14 | 19 | 218 |
| [bookingsystem.h](/bookingsystem.h) | C++ | 41 | 0 | 7 | 48 |
| [city.cpp](/city.cpp) | C++ | 30 | 0 | 9 | 39 |
| [city.h](/city.h) | C++ | 20 | 0 | 6 | 26 |
| [date.cpp](/date.cpp) | C++ | 46 | 0 | 13 | 59 |
| [date.h](/date.h) | C++ | 24 | 0 | 5 | 29 |
| [images.qrc](/images.qrc) | Qrc | 66 | 0 | 1 | 67 |
| [main.cpp](/main.cpp) | C++ | 40 | 3 | 8 | 51 |
| [order.cpp](/order.cpp) | C++ | 164 | 0 | 36 | 200 |
| [order.h](/order.h) | C++ | 65 | 0 | 6 | 71 |
| [ordermanager.cpp](/ordermanager.cpp) | C++ | 193 | 0 | 22 | 215 |
| [ordermanager.h](/ordermanager.h) | C++ | 28 | 0 | 8 | 36 |
| [passenger.cpp](/passenger.cpp) | C++ | 80 | 0 | 18 | 98 |
| [passenger.h](/passenger.h) | C++ | 32 | 0 | 6 | 38 |
| [passengermanager.cpp](/passengermanager.cpp) | C++ | 88 | 0 | 10 | 98 |
| [passengermanager.h](/passengermanager.h) | C++ | 26 | 0 | 7 | 33 |
| [qml/SessionState.qml](/qml/SessionState.qml) | QML | 12 | 0 | 3 | 15 |
| [qml/components/AccountCard.qml](/qml/components/AccountCard.qml) | QML | 83 | 8 | 12 | 103 |
| [qml/components/BasicScrollBar.qml](/qml/components/BasicScrollBar.qml) | QML | 27 | 0 | 5 | 32 |
| [qml/components/CheckButton.qml](/qml/components/CheckButton.qml) | QML | 50 | 0 | 8 | 58 |
| [qml/components/ConfirmCancelDialog.qml](/qml/components/ConfirmCancelDialog.qml) | QML | 71 | 1 | 17 | 89 |
| [qml/components/ConfirmDialog.qml](/qml/components/ConfirmDialog.qml) | QML | 52 | 1 | 9 | 62 |
| [qml/components/CustomButton.qml](/qml/components/CustomButton.qml) | QML | 58 | 6 | 13 | 77 |
| [qml/components/Header.qml](/qml/components/Header.qml) | QML | 54 | 2 | 8 | 64 |
| [qml/components/MenuButton.qml](/qml/components/MenuButton.qml) | QML | 80 | 26 | 15 | 121 |
| [qml/components/MyCalendar.qml](/qml/components/MyCalendar.qml) | QML | 239 | 10 | 12 | 261 |
| [qml/components/MyCheckBox.qml](/qml/components/MyCheckBox.qml) | QML | 51 | 0 | 8 | 59 |
| [qml/components/OrderCard.qml](/qml/components/OrderCard.qml) | QML | 280 | 26 | 38 | 344 |
| [qml/components/PassengerCard.qml](/qml/components/PassengerCard.qml) | QML | 112 | 16 | 24 | 152 |
| [qml/components/SearchBar.qml](/qml/components/SearchBar.qml) | QML | 44 | 0 | 6 | 50 |
| [qml/components/SelectButton.qml](/qml/components/SelectButton.qml) | QML | 62 | 6 | 11 | 79 |
| [qml/components/SideBar.qml](/qml/components/SideBar.qml) | QML | 96 | 2 | 12 | 110 |
| [qml/components/StationListView.qml](/qml/components/StationListView.qml) | QML | 165 | 22 | 29 | 216 |
| [qml/components/TicketCard.qml](/qml/components/TicketCard.qml) | QML | 342 | 28 | 27 | 397 |
| [qml/components/TimetableView.qml](/qml/components/TimetableView.qml) | QML | 221 | 36 | 36 | 293 |
| [qml/components/TrainCard.qml](/qml/components/TrainCard.qml) | QML | 120 | 2 | 16 | 138 |
| [qml/components/test.qml](/qml/components/test.qml) | QML | 59 | 4 | 6 | 69 |
| [qml/main.qml](/qml/main.qml) | QML | 83 | 7 | 11 | 101 |
| [qml/pages/AddPassengerDialog.qml](/qml/pages/AddPassengerDialog.qml) | QML | 173 | 13 | 16 | 202 |
| [qml/pages/AddPassingStationDialog.qml](/qml/pages/AddPassingStationDialog.qml) | QML | 187 | 19 | 28 | 234 |
| [qml/pages/AddUserDialog.qml](/qml/pages/AddUserDialog.qml) | QML | 143 | 10 | 17 | 170 |
| [qml/pages/EditPassengerInfoDialog.qml](/qml/pages/EditPassengerInfoDialog.qml) | QML | 192 | 9 | 17 | 218 |
| [qml/pages/EditPassingStationDialog.qml](/qml/pages/EditPassingStationDialog.qml) | QML | 187 | 19 | 28 | 234 |
| [qml/pages/EditSeatTemplateDialog.qml](/qml/pages/EditSeatTemplateDialog.qml) | QML | 428 | 15 | 49 | 492 |
| [qml/pages/Login.qml](/qml/pages/Login.qml) | QML | 184 | 11 | 17 | 212 |
| [qml/pages/MyOrders.qml](/qml/pages/MyOrders.qml) | QML | 249 | 23 | 26 | 298 |
| [qml/pages/OrderConfirm.qml](/qml/pages/OrderConfirm.qml) | QML | 365 | 37 | 51 | 453 |
| [qml/pages/OrderManagement.qml](/qml/pages/OrderManagement.qml) | QML | 250 | 23 | 26 | 299 |
| [qml/pages/PassengerInfo.qml](/qml/pages/PassengerInfo.qml) | QML | 265 | 19 | 26 | 310 |
| [qml/pages/PersonalInfoDialog.qml](/qml/pages/PersonalInfoDialog.qml) | QML | 165 | 9 | 15 | 189 |
| [qml/pages/Profile.qml](/qml/pages/Profile.qml) | QML | 275 | 21 | 27 | 323 |
| [qml/pages/RegisterDialog.qml](/qml/pages/RegisterDialog.qml) | QML | 252 | 403 | 63 | 718 |
| [qml/pages/ResetPasswordDialog.qml](/qml/pages/ResetPasswordDialog.qml) | QML | 124 | 9 | 15 | 148 |
| [qml/pages/StationListDialog.qml](/qml/pages/StationListDialog.qml) | QML | 104 | 7 | 20 | 131 |
| [qml/pages/SubmitOrderDialog.qml](/qml/pages/SubmitOrderDialog.qml) | QML | 144 | 30 | 21 | 195 |
| [qml/pages/TicketQuery.qml](/qml/pages/TicketQuery.qml) | QML | 319 | 20 | 48 | 387 |
| [qml/pages/TicketQueryResult.qml](/qml/pages/TicketQueryResult.qml) | QML | 444 | 70 | 52 | 566 |
| [qml/pages/Timetable.qml](/qml/pages/Timetable.qml) | QML | 24 | 0 | 5 | 29 |
| [qml/pages/TimetableManagement.qml](/qml/pages/TimetableManagement.qml) | QML | 116 | 9 | 18 | 143 |
| [qml/pages/TrainManagement.qml](/qml/pages/TrainManagement.qml) | QML | 243 | 19 | 31 | 293 |
| [qml/pages/UserManagement.qml](/qml/pages/UserManagement.qml) | QML | 236 | 14 | 34 | 284 |
| [resources/icon/arrow.svg](/resources/icon/arrow.svg) | XML | 48 | 0 | 1 | 49 |
| [station.cpp](/station.cpp) | C++ | 37 | 0 | 11 | 48 |
| [station.h](/station.h) | C++ | 22 | 0 | 6 | 28 |
| [stationmanager.cpp](/stationmanager.cpp) | C++ | 66 | 0 | 12 | 78 |
| [stationmanager.h](/stationmanager.h) | C++ | 24 | 0 | 6 | 30 |
| [time.cpp](/time.cpp) | C++ | 83 | 0 | 18 | 101 |
| [time.h](/time.h) | C++ | 28 | 0 | 6 | 34 |
| [timetable.cpp](/timetable.cpp) | C++ | 189 | 0 | 17 | 206 |
| [timetable.h](/timetable.h) | C++ | 28 | 9 | 6 | 43 |
| [tmp.qml](/tmp.qml) | QML | 212 | 30 | 41 | 283 |
| [train.cpp](/train.cpp) | C++ | 82 | 0 | 13 | 95 |
| [train.h](/train.h) | C++ | 26 | 0 | 7 | 33 |
| [trainmanager.cpp](/trainmanager.cpp) | C++ | 146 | 0 | 15 | 161 |
| [trainmanager.h](/trainmanager.h) | C++ | 27 | 2 | 8 | 37 |
| [user.cpp](/user.cpp) | C++ | 67 | 0 | 16 | 83 |
| [user.h](/user.h) | C++ | 29 | 0 | 6 | 35 |
| [userprofile.cpp](/userprofile.cpp) | C++ | 49 | 0 | 13 | 62 |
| [userprofile.h](/userprofile.h) | C++ | 26 | 0 | 6 | 32 |

[Summary](results.md) / Details / [Diff Summary](diff.md) / [Diff Details](diff-details.md)