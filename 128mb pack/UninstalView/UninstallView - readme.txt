UninstallView v1.40
Copyright (c) 2017 - 2020 Nir Sofer
Web site: https://www.nirsoft.net

Description
===========

UninstallView is a tool for Windows that collects information about all
programs installed on your system and displays the details of the
installed programs in one table. You can use it to get installed programs
information for your local system, for remote computer on your network,
and for external hard-drive plugged to your computer. It also allows you
to easily uninstall a software on your local computer and remote computer
(Including quiet uninstall if the installer supports it).
Starting from version 1.30, you can also view and uninstall Windows Apps
if the 'Load Windows Apps' option is turned on.

This tool works on any version of Windows, starting from Windows XP and
up to Windows 10. Both 32-bit and 64-bit systems are supported.


Start Using UninstallView
=========================

UninstallView doesn't require any installation process or additional DLL
files. In order to start using it, simply run the executable file -
UninstallView.exe
After running UninstallView, it scans your local system and collects all
information about the programs installed on your system. When the
scanning process is finished, the installed programs information is
displayed in the main window.

Notice: UninstallView first takes the official uninstall information in
the Registry provided by the software itself and then tries to complete
any missing information from other places. It's possible that some of the
unofficial information collected by UninstallView will be inaccurate.

Loading uninstall information from other sources
================================================

In order to load uninstall information from other sources (instead of
your current system), press F9 (Advanced Options) and choose the desired
option in the 'Load From' combo-box:
* Local system - current user: This is the default option, the
  uninstall information is loaded from your local system and current user.
* Local system - all users: UninstallView loads the uninstall
  information from your local system and current user, and also from all
  other users on this system. The scanning of other users works only if
  you have read access to the profile of other users and their Registry
  file is not locked. It's recommended to use this option with elevation
  (Ctrl+F11)
* Remote computer: UninstallView loads the uninstall information from a
  remote computer on your network. You need admin access to the remote
  machine in order to use this option. Also, if the Remote Registry
  service on the remote machine is turned off, you should turn on the
  'Automatically turn on the remote Registry service' option.
* Remote computer - all users: Similar to the 'Remote computer' option,
  but in this option UninstallView also scans the Registry of all user
  profiles on the remote system. The scanning of other users works only
  if you have read access to the profile of other users and their
  Registry file is not locked.
* External drive: UninstallView loads the uninstall information from
  external hard drive plugged to your computer. You may need to run
  UninstallView as administrator (Ctrl+F11) in order to access the
  Registry files on the external drive.
* Older Uninstall data from shadow copy (Requires elevation): If you
  have shadow copies on your system, you can watch the installed programs
  list from the day that the shadow copy was created.

Loading Speed
=============

With UninstallView you can choose 3 different loading speeds: (In
'Advanced Options' window)
* Slow with most details (The default)
* Medium speed with medium details
* Fast with least details
The medium/fast speed might be useful if you connect a remote computer
and the loading process is too slow. But... Be aware that some of the
uninstall details will be missing when using the Medium/Fast mode. There
is also "Don't load icons" option that might increase the loading speed
by avoiding from loading the icons of installed programs.

Uninstall a software with UninstallView
=======================================

UninstallView provides 3 option to uninstall a software:
* Uninstall Selected Software: This option runs the standard uninstall
  command of the software, like in the 'Programs and Features' module in
  Control Panel of Windows.
* Change Install Of Selected Software: This option runs the standard
  change install command of the software (Only if it's available), like
  in the 'Programs and Features' module in Control Panel of Windows.
* Quietly Uninstall Selected Software: This option runs the uninstall
  of the software without displaying any user interface. Only if
  quiet/silent uninstall is available for this software. You can check
  whether UninstallView can initiate a quiet uninstall by looking at the
  'Quiet Uninstall String' column. If it's not empty, it means that there
  is quiet uninstall support.

Uninstall a software on remote network computer
===============================================

UninstallView allows you to uninstall a software on a remote computer by
using the PsExec tool from SysInternals/Microsoft. You have to put
PsExec.exe in the same folder of UninstallView.exe and then the uninstall
options will be enabled when connecting a remote machine. The most useful
option for remote computer is 'Quiet Uninstall' because the software is
uninstalled without displaying anything on the screen of the remote
computer. Be aware that the uninstall on the remote machine is executed
with SYSTEM user, and some uninstallers might work improperly when
running them remotely.

Deleting Registry Keys Of Installed Software (For Advanced Users Only)
======================================================================

By default, the option of deleting the Registry key of installed software
is disabled. You can enable this option by changing the value of
AllowDeleteRegKey to 1 in UninstallView.cfg :
AllowDeleteRegKey=1

You can also enable this option from command-line:
UninstallView.exe /AllowDeleteRegKey 1

After you enable this option, the 'Delete Registry Keys Of Selected
Items' menu item (Under the File menu) will be enabled. Be aware that
this option is only available when the 'Load From' option is 'Local
system - current user'. Also, in order to delete uninstall items on
HKEY_LOCAL_MACHINE, you have to run UninstallView as administrator.

Warning: After deleting the Registry key of installed software you will
not be able to uninstall it. Using this feature is on your own risk.

The Options Menu
================


* Uninstall Run Mode: In this option you choose how UninstallView runs
  the uninstall command when using the 'Uninstall Selected Software',
  'Change Install Of Selected Software' and 'Quietly Uninstall Selected
  Software' actions:
  o Run as administrator if it's required: This is the default
    option. UninstallView will run the uninstall command as administrator
    (elevation) only if it's required by the installer or by the
    operating system.
  o Always run as administrator: UninstallView will always run the
    uninstall command as administrator.

* Show 'System Component' Items: By default, UninstallView doesn't
  display the uninstall items marked with 'System Component' attribute
  (The standard uninstall tool of Windows also hides them). You can turn
  on this option in order to view these 'System Component' items. Be
  aware that when this option is turned on, you might see multiple
  uninstall items with identical display name.
* Show Items With Parent Uninstall Entry: By default, UninstallView
  doesn't display uninstall items with parent uninstall entry
  (ParentKeyName Registry value). The standard uninstall tool of Windows
  also hides them. You can turn on this option in order to view uninstall
  items with parent entry.
* Show Items Without Uninstall String: By default, UninstallView
  doesn't display uninstall items that don't have uninstall command
  string. You can turn on this option in order to view these items, but
  be aware that UninstallView cannot uninstall these items.
* Show Items Without Display Name: By default, UninstallView doesn't
  show uninstall items that don't have display name. You can turn on this
  option if you want to view these items.
* Allow Uninstall Of Multiple Items: If you enable this option,
  UninstallView will allow you to uninstall multiple programs at once.
  It's very powerful, but it also might be fatal if you use it improperly
  (For example: running quiet uninstall for all software on your
  system...). Enabling this option is on your own risk.

Columns Description
===================


* Display Name: The official display name of the software (Stored in
  the Registry)
* Registry Name: The name of the Registry key (under
  HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall
  or
  HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Uninstall )
* Display Version: The official display version of the software (Stored
  in the Registry)
* Registry Time: The date/time that the Registry key of the software
  was modified. In most cases, this date/time represents the time that
  the software was installed or updated.
* Install Date: The official install date of the software, stored in
  the Registry by the installer of the software.
* Installed For: If the software was installed for specific user (under
  HKEY_CURRENT_USER) the name of the user profile is displayed. If the
  software was installed for all users (under HKEY_LOCAL_MACHINE), this
  columns tells you whether it's 32-bit or 64-bit installation.
* Install Location: The path of the folder where the software is
  installed.
* Install Folder Created Time: The creation date/time of the
  installation folder.
* Install Folder Modified Time: The modified date/time of the
  installation folder.
* Publisher: The creator of this software.
* Uninstall String: Full command to uninstall this software.
* Quiet Uninstall String: Full command to quietly uninstall this
  software.
* Change Install String: Full command to change the installation of
  this software.
* Comments: Comment about the software, stored in the uninstall
  Registry key by the software installer.
* About URL: URL for the link to the publishers home page or the
  application's home page.
* Update Info URL: URL for the link used to update information on the
  application.
* Help Link: Internet address for technical support
* Install Source: The folder that contained the installer files.
* Installer Name: Name of the installer that was used to install this
  software (Windows Installer, Nullsoft Install System, Inno Setup, and
  others...)
* Release Type: Displays the release type of this software, like
  'Security Update', 'Update Rollup'. For most installed programs, this
  field is empty.
* Display Icon Path: Full path of filename that contains the icon of
  the software.
* MSI Filename: Specifies the MSI filename of this software (Windows
  Installer only)
* Estimated Size: Estimated size of this software (Taken from the
  Registry)
* Attributes: Displays attributes stored in the uninstall Registry key
  of this software ,like 'System Component', 'No Modify', 'Windows
  Installer'.
* Language: Langauge of the software (like en-US)
* Parent Key Name: Displays the Registry name of the parent uninstall
  item. Be aware that uninstall items with parent are displayed only when
  the 'Show Items With Parent Uninstall Entry' option is turned on.
* Registry Key: Full Path of the uninstall Registry key.

Command-Line Options
====================

/uninstall <Name>
Uninstall the specified software. You can specify the 'Display Name' or
'Registry Name', for example:
UninstallView.exe /uninstall "Google Chrome"

/quninstall <Name>
Quietly uninstall the specified software (Without displaying user
interface). You can specify the 'Display Name' or 'Registry Name'.

/quninstallwildcard <Wildacrd Name> {Max Items}
Quietly uninstall the specified software (Without displaying user
interface). You can specify wildcard of the display name, in order to use
the same command to uninstall different versions of a software, for
example:
UninstallView.exe /quninstallwildcard "Mozilla Firefox*"

By default, this command uninstall only one item even if there are
multiple uninstall items that match the wildcard. If from some reason you
want to uninstall multiple items, you can specify the maximum number of
items to uninstall in the {Max Items} parameter, for example:
UninstallView.exe /quninstallwildcard "Mozilla Firefox*" 5

/changeinstall <Name>
Change the installation of the specified software. You can specify the
'Display Name' or 'Registry Name'.

/cfg <Filename>
Start UninstallView with the specified configuration file. For example:
UninstallView.exe /cfg "c:\config\unv.cfg"
UninstallView.exe /cfg "%AppData%\UninstallView.cfg"

/RunAsAdmin
Runs UninstallView as administrator.

/stext <Filename>
Save the installed programs list into a simple text file.

/stab <Filename>
Save the installed programs list into a tab-delimited text file.

/scomma <Filename>
Save the installed programs list into a comma-delimited text file (csv).

/stabular <Filename>
Save the installed programs list into a tabular text file.

/shtml <Filename>
Save the installed programs list into HTML file (Horizontal).

/sverhtml <Filename>
Save the installed programs list into HTML file (Vertical).

/sxml <Filename>
Save the installed programs list into XML file.

/sjson <Filename>
Save the installed programs list into JSON file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. The <column> parameter can specify the column
index (0 for the first column, 1 for the second column, and so on) or the
name of the column, like "Display Name" and "Display Version". You can
specify the '~' prefix character (e.g: "~Publisher") if you want to sort
in descending order. You can put multiple /sort in the command-line if
you want to sort by multiple columns.

/ShowItemsWithoutUninstallStr [0 | 1]
/ShowItemsWithoutDisplayName [0 | 1]
/ShowSystemComponents [0 | 1]
/ShowItemsWithParent [0 | 1]
/LoadFrom [1 - 6]
/ComputerName [Computer Name]
/LoadingSpeed [1 - 3]
.
.
.
You can use any variable inside the .cfg file in order to set the
configuration from command line, here's some examples:

Load uninstall data of all users on the remote computer with IP address
192.168.0.55 and also display 'System Component' entries:
UninstallView.exe /LoadFrom 4 /ComputerName "192.168.0.55"
/ShowSystemComponents 1

Load uninstall entries of all users on this system including items with
parent entry, and export them to csv file:
UninstallView.exe /LoadFrom 2 /ShowItemsWithParent 1 /scomma
"c:\temp\uninstall1.csv"

Load uninstall data of current user on remote computer 192.168.0.101 in
'Fast' loading speed and export to html file:
UninstallView.exe /LoadFrom 3 /ComputerName "192.168.0.101" /LoadingSpeed
3 /shtml "c:\temp\uninstall1.html"