# Godot Jobs List

Just small helper for Godot 4, which loads jobs list from .json file.

## How to use it?



* Download and install plugin

* Add node `AllJobsList` to your scene

* Create .json file and put it to field **Json path**

* Now `AllJobsList` node can be used as editor, put needed data to field **All Jobs**

* Save data to json via button **Save**

* You can also modify your json via externel editor and reload Godot editor via button **Refresh**

* If you need random picker from jobs list, use `LocalJobsList` node and configure it

You can check example.

Also you can do a job filter. You need to inherite the `LocalJobsList` class and override the `_filter` method.
