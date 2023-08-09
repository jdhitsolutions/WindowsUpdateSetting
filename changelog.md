# Changelog for WindowsUpdateSetting

## v1.0.0

### Changed

- Module re-organization and code cleanup.
- Revised `Get-WindowsUpdateDeferral` to provide a warning message if no deferral settings are found instead of throwing an exception.
- Updated `README.md`.
- Help updates.
- Bumped the version number to reflect the number of significant changes.

### Added

- Added custom format files `windowsupdatesetting.format.ps1xml` and windowsactivehours.format.ps1xml`.
- Added missing online help links.
-
## v0.3.2

- file cleanup for PowerShell Gallery
- manifest update

## v0.3.1

- Updated manifest
- Updated help for `Suspend-WindowsUpdate` ([Issue #4](https://github.com/jdhitsolutions/WindowsUpdateSetting/issues/4))
- Added module icon
- Updated README
- Added some command aliases

## v0.3.0

- Updated ShouldProcess message on `Suspend-WindowsUpdate` ([Issue #3](https://github.com/jdhitsolutions/WindowsUpdateSetting/issues/3))
- Added custom type names to PSCustomObject output ([Issue #2](https://github.com/jdhitsolutions/WindowsUpdateSetting/issues/2))
- Updated README
- Updated documentation

## v0.2.1

- Github updates
- Updated README

## v0.2.0

- Updated manifest
- Added functions to defer feature and quality updates
- Added function set manage Windows Active hours
- Modified `Suspend-WindowsUpdate` to specify a resume date.
- Updated documentation

## v0.1.0

- initial files
