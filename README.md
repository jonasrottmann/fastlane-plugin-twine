# twine plugin

[![Travis CI](https://img.shields.io/travis/jonasrottmann/fastlane-plugin-twine.svg?style=flat)](https://travis-ci.org/jonasrottmann/fastlane-plugin-twine)
[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-twine)
[![Gem](https://img.shields.io/gem/v/fastlane-plugin-twine.svg?style=flat)](http://rubygems.org/gems/fastlane-plugin-twine)
[![License](https://img.shields.io/github/license/SiarheiFedartsou/fastlane-plugin-twine.svg)](https://github.com/jonasrottmann/fastlane-plugin-twine/blob/master/LICENSE)


## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-twine`, add it to your project by running:

```bash
fastlane add_plugin twine
```

## About the plugin

This plugin provides easy access to common actions (e.g. generating the localization files) you would normally perform with [_twine_](https://github.com/scelis/twine) and adds some extra functionality.

### Configuration file

Check out the [example configuration](fastlane/example_config.json).

JSON file scheme:

```json
[
    {
        "description": "",
        "source_path": "",
        "twine_args": "",
        "destination_path": ""
    }
]
```

* `description`: This is optional but recommended to make the output more readable.
* `source_path`: The path to your twine file. This is required.
* `twine_args`: Additional args to pass to twine. For example: `--lang en --format android`
* `destination_path`: The path where the generated translation file will be found. This is required.


## Example

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane all`.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.
