# Changelog for WindowsUpdateSetting

## [Unreleased]

## [1.1.0] - 2025-03-18

### Added

- Added custom verbose messaging using localized string data.

### Changed

- Changed online help links.
- Converted `Changelog` to new format.
- Updated `README`.

## [v1.0.0] - 2023-08-09

### Changed

- Module re-organization and code cleanup.
- Revised `Get-WindowsUpdateDeferral` to provide a warning message if no deferral settings are found instead of throwing an exception.
- Updated `README.md`.
- Help updates.
- Bumped the version number to reflect the number of significant changes.

### Added

- Added custom format files `windowsupdatesetting.format.ps1xml` and windowsactivehours.format.ps1xml`.
- Added missing online help links.

## [v0.3.2] - 2018-10-23

- file cleanup for PowerShell Gallery
- manifest update

## [v0.3.1] - 2018-09-24

- Updated manifest
- Updated help for `Suspend-WindowsUpdate` ([Issue #4](https://github.com/jdhitsolutions/WindowsUpdateSetting/issues/4))
- Added module icon
- Updated README
- Added some command aliases

## [v0.3.0] - 2018-09-20

- Updated ShouldProcess message on `Suspend-WindowsUpdate` ([Issue #3](https://github.com/jdhitsolutions/WindowsUpdateSetting/issues/3))
- Added custom type names to PSCustomObject output ([Issue #2](https://github.com/jdhitsolutions/WindowsUpdateSetting/issues/2))
- Updated README
- Updated documentation

## v0.2.1 - 2018-09-20

- Github updates
- Updated README

## v0.2.0 - 2018-09-20

- Updated manifest
- Added functions to defer feature and quality updates
- Added function set manage Windows Active hours
- Modified `Suspend-WindowsUpdate` to specify a resume date.
- Updated documentation

## v0.1.0 - 2018-09-19

- initial files

[Unreleased]: https://github.com/jdhitsolutions/WindowsUpdateSetting/compare/v1.1.0..HEAD
[v1.1.0]: https://github.com/jdhitsolutions/WindowsUpdateSetting/compare/1.0.0..v1.1.0
[v1.0.0]: https://github.com/jdhitsolutions/WindowsUpdateSetting/compare/v0.3.2..v1.0.0
[v0.3.2]: https://github.com/jdhitsolutions/WindowsUpdateSetting/compare/0.3.1..v0.3.2
[v0.3.1]: https://github.com/jdhitsolutions/WindowsUpdateSetting/compare/0.3.0..0.3.1
[v0.3.0]: https://github.com/jdhitsolutions/WindowsUpdateSetting/compare/0.2.1..0.3.0