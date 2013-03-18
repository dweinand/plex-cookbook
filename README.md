plex cookbook
=============
This is a set of chef recipes for setting up a plex media server or media center.

Requirements
------------

### Platform
These recipes have been tested on Mac OS X 10.8, but may work on earlier versions.

### Cookbooks
This cookbook relies on opscode's dmg cookbook.

Attributes
----------

#### plex::media_server
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['plex']['media_server']['dmg_url']</tt></td>
    <td>String</td>
    <td>Url to the dmg to use for installing Plex Media Server</td>
    <td>[Latest official non-plex-pass release]</td>
  </tr>
  <tr>
    <td><tt>['plex']['media_server']['dmg_volume']</tt></td>
    <td>String</td>
    <td>Name of the volume the dmg will mount</td>
    <td><tt>PlexMediaServer</tt></td>
  </tr>
</table>

#### plex::media_center
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['plex']['media_center']['zip_url']</tt></td>
    <td>String</td>
    <td>Url to the zip file to use for installing Plex Media Center</td>
    <td>[Latest official non-plex-pass release]</td>
  </tr>
</table>

#### plex::channels
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['plex']['media_server']['channels']</tt></td>
    <td>Array</td>
    <td>List of channels to install</td>
    <td><tt>[]</tt></td>
  </tr>
</table>

#### plex::flash_player
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['plex']['flash_player']['dmg_url']</tt></td>
    <td>String</td>
    <td>Url to the dmg to use for installing Adobe Flash Player</td>
    <td>[Latest official release]</td>
  </tr>
  <tr>
    <td><tt>['plex']['flash_player']['dmg_volume']</tt></td>
    <td>String</td>
    <td>Name of the volume the dmg will mount</td>
    <td><tt>Adobe Flash Player Installer</tt></td>
  </tr>
</table>

#### plex::silverlight
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['plex']['silverlight']['dmg_url']</tt></td>
    <td>String</td>
    <td>Url to the dmg to use for installing Microsoft Silverlight</td>
    <td>[Latest official release]</td>
  </tr>
  <tr>
    <td><tt>['plex']['silverlight']['pkg_id']</tt></td>
    <td>String</td>
    <td>Identifer for the installer package</td>
    <td><tt>com.microsoft.SilverlightInstaller</tt></td>
  </tr>
</table>

Usage
-----
#### plex::channels

Specify a list of channels to install in your node data, and include plex::channels in the run_list.

Each channel should be hash of the name of the channel, and it's bundle identifier.


```json
{
  "name":"my_node",
  "plex": {
    "media_server": {
      "channels": [
        {
          "name": "The Colbert Report",
          "id": "com.plexapp.plugins.thecolbertreport"
        },
        {
          "name": "The Daily Show",
          "id": "com.plexapp.plugins.thedailyshow"
        }
      ]
    }
  }
  "run_list": [
    "recipe[plex::media_server]",
    "recipe[plex::channels]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Dan Weinand

License: MIT
