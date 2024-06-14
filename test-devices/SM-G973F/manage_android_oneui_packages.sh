


adb root


# sec = Samsung Electronics Co.
# Search enabled packages: pm list packages -e | grep '<KEYWORD>'
# List of diabled packages: pm list packages -d
# List of enabled packages: pm list packages -e
# List of all packages: pm list packages
#### VERY SPECIFIC TO THE SAMSUNG GALAXY S10 ####
# disabling/enabling Samsung specific services and app
# https://docs.samsungknox.com/admin/knox-platform-for-enterprise/assets/G975N_Q.pdf
ENABLE_PACKAGES="disable" # "disable" or "enable"

# Samsung Bixby
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.app.settings.bixby"
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.systemui.bixby2"
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.bixby.service"
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.bixby.agent"
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.bixby.wakeup"

# Samsung Bixby Vision
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.visionintelligence"

# Samsung Bixby Routines
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.app.routines"

# Samsung Finder (Searchbar at the top)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.app.galaxyfinder"

# Samsung Kids Home Installer
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.kidsinstaller"

# Samsung Kids Mode friends
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.app.camera.sticker.facearavatar.preload"

# Samsung Digital Wellbeing & Parental Controls 
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.forest"

# Samsung AR Emoji
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.aremoji"

# Samsung Media and devices feature
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.mdx.quickboard"

# Samsung Link to Windows Service
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.mdx"
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.microsoft.appmanager"

# Samsung Daily (News page on the home screen)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.app.spage"

# Samsung Weather
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.android.daemonapp"

# Samsung Accessibility (https://galaxystore.samsung.com/detail/com.samsung.accessibility)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.accessibility"

# Samsung EasyOneHand (https://www.samsung.com/au/support/mobile-devices/using-one-handed-mode/)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.android.easyonehand"

# Samsung Galaxy Friends
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.mateagent"

# Samsung Checkout (https://galaxystore.samsung.com/detail/com.sec.android.app.billing)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.android.app.billing"

# Samsung Pay
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.spayfw"

# Samsung Payment Services --- ABSOLUTLY REQUIRED OR THE SAMSUNG PHONE GETS LOCKED (Code 6084) ----
#adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.kgclient"

# Samsung AR Doodle
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.ardrawing"

# Samsung Cloud
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.scloud"

# Samsung Upday (https://play.google.com/store/apps/details?id=de.axelspringer.yana.zeropage)
adb shell -t su -c "pm ${ENABLE_PACKAGES} de.axelspringer.yana.zeropage"

# Samsung Wifi Tips
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.net.wifi.wifiguider"

# Samsung SmartThings
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.easysetup"

# Samsung Dicitionary
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.diotek.sec.lookup.dictionary"

# Samsung MirrorLink
#adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.app.mirrorlink" # not on this device

# Samsung DeX for PC
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.android.app.dexonpc"

# Samsung DeX
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.android.desktopmode.uiservice"

# Samsung DeX System UI
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.desktopsystemui"

# Samsung Facial Recognition
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.bio.face.service"

# Samsung EdgeScreen (https://www.samsung.com/uk/support/mobile-devices/what-is-the-edge-panel-and-how-do-i-use-it/)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.app.cocktailbarservice"
# Quicktool (EdgeScreen)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.android.app.quicktool"
# Tasks (EdgeScreen)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.app.taskedge"
# Apps (EdgeScreen)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.app.appsedge"
# Clipboard (EdgeScreen)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.app.clipboardedge"
# People (EdgeScreen)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.service.peoplestripe"

# Samsung SmartMirror (https://www.samsung.com/at/support/tv-audio-video/was-ist-die-funktion-screen-mirroring/)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.smartmirroring"

# Samsung Calendar (App)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.calendar"

# Samsung Reminder (App, https://galaxystore.samsung.com/detail/com.samsung.android.app.reminder)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.app.reminder"

# Samsung Clock (App, https://galaxystore.samsung.com/detail/com.sec.android.app.clockpackage)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.android.app.clockpackage"

# Samsung Phone (App)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.phone"

# Samsung Phone Dialer
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.dialer"

# Samsung Phone UI
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.phone.overlay.common"

# Samsung Contacts (App)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.app.contacts"

# Samsung Contacts Storage
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.providers.contacts"

# Samsung Favorite Contacts
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.android.widgetapp.easymodecontactswidget"

# Samsung Smart Suggestions (App)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.smartsuggestions"

# Samsung Internet Browser (App, https://play.google.com/store/apps/details?id=com.sec.android.app.sbrowser)

# Samsung Gallery (App for photos and videos)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.android.gallery3d"

# Samsung Photo Editor (https://galaxystore.samsung.com/detail/com.sec.android.mimage.photoretouching)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.android.mimage.photoretouching"

# Samsung Studio (Video Editor, https://galaxystore.samsung.com/detail/com.sec.android.app.vepreload)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.android.app.vepreload"


# Samsung Editing Assets (Background music from Video Editor,..., https://galaxystore.samsung.com/detail/com.sec.android.app.ve.vebgm)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.android.app.ve.vebgm"

# Samsung Galaxy Store (App, app store)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.android.app.samsungapps"

# Samsung AR Zone (App, https://galaxystore.samsung.com/prepost/000005227810)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.arzone"

# Samsung Calculator (App, https://play.google.com/store/apps/details?id=com.sec.android.app.popupcalculator)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.android.app.popupcalculator"

# Samsung Galaxy Theme Store (https://galaxystore.samsung.com/detail/com.samsung.android.themestore)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.themestore"

# Samsung Wallpaper (App, https://galaxystore.samsung.com/detail/com.samsung.android.app.dressroom)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.app.dressroom"

# Samsung Messaging (App)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.messaging"

# Samsung Health Service
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.android.service.health"

# Samsung Gaming Hub (App)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.game.gamehome"

# Samsung Gaming Tools
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.game.gametools"

# Samsung Camera (App, https://galaxystore.samsung.com/detail/com.sec.android.app.camera)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.android.app.camera"

# Samsung Single Take (https://www.samsung.com/uk/support/mobile-devices/take-various-photos-and-videos-using-galaxy-s20-plus-s20-ultras-single-take-mode/)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.singletake.service"

# Samsung Factory Camera
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.factory"

# Samsung Camera Magnifier (https://galaxystore.samsung.com/detail/com.sec.android.app.magnifier)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.android.app.magnifier"

# Samsung Game Optimizing Service
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.game.gos"

# Samsung Live Stickers, Deco Pic (https://galaxystore.samsung.com/detail/com.samsung.android.livestickers)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.livestickers"

# Samsung LED Cover (https://galaxystore.samsung.com/detail/com.samsung.android.app.ledbackcover)
# https://www.samsung.com/de/support/mobile-devices/galaxy-s10-led-cover-einrichten/
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.app.ledbackcover"
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.android.cover.ledcover"

# Samsung Cloud Platform Manager (https://galaxystore.samsung.com/detail/com.samsung.android.sm.policy)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.sm.policy"

# Samsung S Voice (https://galaxystore.samsung.com/detail/com.samsung.android.svoiceime)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.svoiceime"

# Samsung Group Share (https://galaxystore.samsung.com/detail/com.samsung.android.mobileservice)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.mobileservice"

# Samsung Push Service (https://galaxystore.samsung.com/detail/com.sec.spp.push)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.spp.push"

# Samsung QuickShare (https://galaxystore.samsung.com/detail/com.samsung.android.app.sharelive)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.app.sharelive"

# Samsung Link-Sharing (https://galaxystore.samsung.com/detail/com.samsung.android.app.simplesharing)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.app.simplesharing"

# Samsung Quick Share Agent (https://galaxystore.samsung.com/detail/com.samsung.android.aware.service)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.aware.service"

# Samsung Wi-Fi Direct (https://www.samsung.com/nz/support/mobile-devices/connecting-devices-using-wifi-direct/)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.allshare.service.fileshare"

# Samsung Dual Messenger (https://www.samsung.com/us/support/answer/ANS00079185/)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.da.daagent"

# Samsung Blue Light Filter
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.bluelightfilter"

# Samsung Pass (https://galaxystore.samsung.com/detail/com.samsung.android.authfw)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.authfw"

# Samsung Password fill (https://galaxystore.samsung.com/prepost/000005295086?amp=&appId=com.samsung.android.samsungpassautofill)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.samsungpassautofill"

# Samsung Pass Provider (Samsung Pass Biometric Scanner, https://galaxystore.samsung.com/detail/com.samsung.android.samsungpass)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.samsungpass"

# Samsung Separate App Sound (https://www.samsung.com/africa_en/support/mobile-devices/useful-audio-settings-on-the-galaxy-phone-including-separate-app-sound/)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.setting.multisound"

# Samsung Handwriting
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.sdk.handwriting"

# Samsung Live Drawing (https://galaxystore.samsung.com/detail/com.samsung.android.service.livedrawing)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.service.livedrawing"

# Samsung VideoTrimmer (https://galaxystore.samsung.com/prepost/000005735514?appId=com.samsung.app.newtrim)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.app.newtrim"

# Samsung Watch Manager Installer (https://galaxystore.samsung.com/detail/com.samsung.android.app.watchmanagerstub)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.app.watchmanagerstub"

# Samsung Always On Display (https://galaxystore.samsung.com/detail/com.samsung.android.app.aodservice)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.app.aodservice"

# Samsung Safety Assistance (https://www.samsung.com/in/support/mobile-devices/what-is-safety-assistance-in-samsung-galaxy-s4/)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.android.app.safetyassurance"

# Samsung One UI Startscreen (https://galaxystore.samsung.com/detail/com.sec.android.app.launcher)
# com.sec.android.app.launcher

# Samsung KLMS Agent (Knox, service to create multiple users)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.klmsagent"

# Samsung Smart Face (e.g. Facial Unlock,...)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.smartface"

# Samsung Find My Mobile
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.fmm"

# Samsung Device Care (https://play.google.com/store/apps/details?id=com.samsung.android.lool)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.lool"

# Samsung Air Command (S-Pen Air command menu, https://www.samsung.com/us/support/answer/ANS00077674/)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.aircommandmanager"

# Samsung Smart Things Framework (https://galaxystore.samsung.com/detail/com.samsung.android.service.stplatform)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.service.stplatform"

# Samsung Text To Speech (https://galaxystore.samsung.com/detail/com.samsung.SMT)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.SMT"

# Samsung Private Share (https://www.samsung.com/uk/support/mobile-devices/how-to-keep-your-personal-data-safe-using-private-share/)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.privateshare"

# Samsung Smart Widget Suggestion (https://www.youtube.com/watch?v=bww-FDy997g)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.app.smartwidget"

# Samsung Smart Call (Report or block spam calls, https://galaxystore.samsung.com/detail/com.samsung.android.smartcallprovider)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.smartcallprovider"
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.hiya.star" # https://de.hiya.com/products-smart-call

# Samsung Sound Picker (Ringtones)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.app.soundpicker"

# Samsung Sound Alive (Sound equilzers, https://www.samsung.com/in/support/mobile-devices/what-is-sound-alive-in-music-player-of-samsung-galaxy-grand/)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.android.app.soundalive"

# Samsung Adapt Sound
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.hearingadjust"

# Samsung Device Health Manager Service
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.android.sdhms"


# Samsung GPU Watch (https://developer.samsung.com/galaxy-gamedev/gpuwatch.html)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.gpuwatchapp"

# Samsung Badge Provider (App Badge Counter next to App Icon)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.android.provider.badge"

# Samsung TalkBack (Screen reader, https://galaxystore.samsung.com/detail/com.samsung.android.accessibility.talkback)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.accessibility.talkback"

# Samsung Face Service (Facial Recognition or unlock)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.faceservice"

# Samsung Wallpaper and style (https://galaxystore.samsung.com/detail/com.samsung.android.app.dressroom)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.app.dressroom"

# Samsung Wallpaper Multi
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.beyond.p00.wallpapermulti"

# Samsung Customization Service (https://galaxystore.samsung.com/detail/com.samsung.android.rubin.app)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.rubin.app"

# Samsung Sticker Center (https://galaxystore.samsung.com/detail/com.samsung.android.stickercenter)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.stickercenter"

# Samsung IpsGeofence (low-power geofencing solution, https://galaxystore.samsung.com/detail/com.samsung.android.ipsgeofence)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.ipsgeofence"

# Samsung DeX Home
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.android.app.desktoplauncher"

# Samsung Video Player (Build in Video Player, https://galaxystore.samsung.com/detail/com.samsung.android.video)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.video"

# Samsung Privacy Dashboard (https://insights.samsung.com/2023/08/17/what-is-privacy-dashboard-and-how-does-it-protect-my-data-2/)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.privacydashboard"

# Samsung Call and text on other devices (https://galaxystore.samsung.com/detail/com.samsung.android.mdecservice)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.mdecservice"

# Samsung Safety Information
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.safetyinformation"

# Samsung Live Focus (Photo tool)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.app.dofviewer"

# Samsung Dynamic Lock (Lock Screen Wallpaper)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.dynamiclock"

# Samsung Themes Service
#adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.themecenter"

# Samsung Capture (Screen recorder, https://galaxystore.samsung.com/detail/com.samsung.android.app.smartcapture)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.app.smartcapture"

# Samsung Gear VR Service
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.hmt.vrsvc"

# Samsung Continuity Service (https://galaxystore.samsung.com/detail/com.samsung.android.mcfds)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.mcfds"

# Samsung AllShare (https://www.samsung.com/in/support/mobile-devices/what-all-you-can-do-with-allshare-play-in-samsung-smart-phones/)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.allshare.service.mediashare"

# Samsung CID MAnager (Carrier Identification Manager, https://fixyourandroid.com/about/cidmanager/)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.cidmanager"

# Samsung Diagnostics Service (https://www.samsung.com/latin_en/support/mobile-devices/how-to-use-diagnostics-in-the-samsung-members-app-on-your-galaxy-device/)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.networkdiagnostic"
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.android.diagmonagent"

# Samsung Call
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.incallui"

# Samsung Call Background Provider
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.callbgprovider"

# Samsung Wi-Fi Calling
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.unifiedwfc"

# Samsung VoIP
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.crane"

# Samsung SimMobilityKit
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.ims.smk"

# Samsung CSC (Consumer Software Customization/Country Specific Code, https://r2.community.samsung.com/t5/Tech-Talk/What-s-CSC-on-Samsung/td-p/4258460)
#adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.sec.android.application.csc"

# Samsung IMS / SMK (Vendor/Carrier communication)
#adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.ims.smk"

# Samsung Sec Media Storage
# com.samsung.android.providers.media

# Samsung IPService
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.ipservice"

# Samsung Configuration Update (Update Manager)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.sdm.config"
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.app.omcagent"
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.app.updatecenter" # probably?

# Samsung AppLinker (Other apps installations and updates, https://galaxystore.samsung.com/detail/com.sec.android.app.applinker)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.android.app.applinker"


# Samsung Calling Screen UI 
# adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.app.telephonyui"
# Samsung Screen Overlay?
#adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.phone.overlay.common"
# Samsung ASAA Service?
#adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.aasaservice"
# Samsung AuthFW?
#adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.tapack.authfw"

# Samsung Smart Manager?
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.sm.policy"
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.sm.devicesecurity"


# Samsung Beacon Manager (GPS? Wifi and Bluetooth for more accurate GPS?)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.beaconmanager"

# Samsung Auto Hotspot
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.mhs.smarttethering"

# Samsung SVC Agent (https://galaxystore.samsung.com/detail/com.samsung.android.svcagent)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.svcagent"

# Samsung RCS (https://en.wikipedia.org/wiki/Rich_Communication_ServicesO)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.rcs"

# Samsung MLP = Mobile Location Protocol (https://en.m.wikipedia.org/wiki/Mobile_Location_Protocol)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.mlp"

# Samsung StoryService (trace app processes)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.storyservice"

# Samsung Location SDK
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.location.nsflp2"

# Samsung slocation
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.location"

# Samsung CMH (Something Photo Gallery related)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.cmh"

# Samsung TEEGRIS (A powerful solution to run applications in a trusted execution environment, https://developer.samsung.com/teegris/overview.html)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.sec.android.teegris.tui_service"

# Samsung Sume? (Might be a feature for remastering photos)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.sume.nn.service"

# Samsung BBC Agent (Anit Malware Service?)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.bbc.bbcagent"

# Samsung MobileWISP (Module for Android that provides a "Wireless Intrusion Prevention System")
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.server.wifi.mobilewips"

# Samsung InCall (Some feature while calling)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.incall.contentprovider"

# Samsung TADownloader (App to update biometric system from samsung)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.tadownloader"

# Samsung Apex Service (Uses microphone?)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.android.app.apex"

# Samsung SecSoundPicker (Something related to ringtones)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.secsoundpicker"

# Samsung Positioning (https://galaxystore.samsung.com/detail/com.samsung.android.samsungpositioning)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.samsungpositioning"

# Samsung Secure Wi-Fi
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.fast"

# Samsung P2P Aware )
# adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.wifi.p2paware.resources"

# --- Samsung Knox ---
# Provides classes that are used for managing containers in a multiuser management environment. (https://docs.samsungknox.com/devref/knox-sdk/reference/com/samsung/android/knox/container/package-summary.html)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.knox.containeragent"
# Lets you check the health of a Samsung Android device, to ensure that it does not compromise the integrity of mobile assets. (https://docs.samsungknox.com/dev/knox-attestation/)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.knox.attestation"
# Knox Analytics Uploader
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.knox.analytics.uploader"
# Knox Separated Apps (https://play.google.com/store/apps/details?id=com.samsung.android.appseparation)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.appseparation"
# Knox MDM (Mobile device management, https://www.samsung.com/us/business/solutions/services/mobility-software/knox-manage/)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.mdm"

# 
#adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.knox.pushmanager"
#
#adb shell -t su -c "pm ${ENABLE_PACKAGES} com.samsung.android.knox.kpecore"


# Samsung Keyboard (https://galaxystore.samsung.com/detail/com.samsung.android.honeyboard)
# com.samsung.android.honeyboard 

# Microsoft Onedrive
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.microsoft.skydrive"



# Facebook
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.facebook.services"
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.facebook.system"
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.facebook.appmanager"

### GOOGLE AND ANDROID SERVICES ###

# Google Partner Setup (Required to run Google Services!)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.google.android.partnersetup"

# Google Services Framework
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.google.android.gsf"

# Google Play Services (https://play.google.com/store/apps/details?id=com.google.android.gms)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.google.android.gms"

# Google Play Store
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.android.vending"

# Google App
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.google.android.googlequicksearchbox"

# Google Drive
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.google.android.apps.docs"

# Google Meet/Duo
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.google.android.apps.tachyon"

# Google Maps 
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.google.android.apps.maps"

# Google Chrome
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.android.chrome"
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.sec.android.app.chromecustomizations"

# Google Gmail
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.google.android.gm"

# Google Assistant
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.android.hotwordenrollment.okgoogle"

# Google Location History
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.google.android.gms.location.history"

# Google Calendar Sync
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.google.android.syncadapters.calendar"

# Google Contacts Sync
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.google.android.syncadapters.contacts"

# Google Text-to-speech
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.google.android.tts"

# Android System Intelligence is a system app on Android that is responsible for a whole host of smart features, including Live Caption, Live Translate, Now Playing, Smart Auto-rotate, and more.
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.google.android.as"

# Google YouTube
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.google.android.youtube"

# Device Health Services
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.google.android.apps.turbo"

# Android Auto
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.google.android.projection.gearhead"

# Google Mainline Service (https://www.theverge.com/2019/5/7/18531350/google-android-q-project-mainline-security-updates-play-store-io-2019)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.google.mainline.telemetry"


#### MORE GENERAL ANDROID SERVICES ###

# Android Bluetooth 
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.android.bluetooth"

# Android Bluetooth MIDI Service
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.android.bluetoothmidiservice"

# Android Q Easter Egg
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.android.egg"

# Android SIM Toolkit
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.android.stk"

# Android Calendar Storage
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.android.providers.calendar"

# Android HTML Viewer
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.android.htmlviewer"

# Android Mms Service (handles (images/files/videos) through text messaging)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.android.mms.service"

# Android Fused Location
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.android.location.fused"

# Android Print Service Recommendation
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.google.android.printservice.recommendation"

# Android Print Spooler
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.android.printspooler"

# Android HotSpot Login Service
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.android.hotspot2.osulogin"

# Android Blocked Numbers Storage
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.android.providers.blockednumber"

# Android Bookmark Provider
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.android.bookmarkprovider"

# Android Partner Bookmarks
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.android.providers.partnerbookmarks"

# Android NFC
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.android.nfc"

# Android NFC Tags
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.android.apps.tag"

# Android Photo Screensavers
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.android.dreams.phototable"

# Android Cell Broadcast Service
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.android.cellbroadcastservice"

# Android ONS (Opportunistic Network Service, https://grouphowto.com/com-android-ons/)
adb shell -t su -c "pm ${ENABLE_PACKAGES} com.android.ons"


# Android Compatibility Test Suite
#com.android.cts.ctsshim

# Software Update
#adb shell -t su -c "pm disable com.wssyncmldm"



adb unroot