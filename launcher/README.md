# Launcher

Launcher is a sample player built on Norn's softcut.


**Dev Log**

The logic of this project is divided into four files:
- clip.lua
- group.lua
- list.lua
- project.lua

Each file represents a wrapper class with a progressivly larger scope.
Clip and Group both are in responsible for interfacing with softcut... a parent class
should be defined for them to inherit from. List is a linked list of clips and groups.
The Project is responsible for managing global state.


*Phase 1*
Just get the basics working. No groups. No done actions. No looping. Just get samples
playing sequentially in our list.
