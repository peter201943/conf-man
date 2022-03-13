
# Peter's Configs

A single folder to manage all of my configs in one place

## NOTICE
- This is a destructive script, make sure you are using it with Git!
- (Does NOT automatically run git, make sure to run it manually to preserve data!)

## Method
- Uses Python 3.10 for execution
- Uses Git to manage changes/documentation-as-commits
- `scripts/` (Python Files) contains Python scripts
- `configs/` (Config Files) contains configuration files/folders
- `paths/` (YAML Files) contains config file names and paths (locations)
- Different Git branches are for different machines

## Example
```yaml
conf/:
  configs/:
    peter-root-config/: # this name does not matter for the paths themselves, just used to distinguish from other configs stored here
      profile.cmd # File could be named almost anything, hence why these folders are necessary
  paths/:
    peter-root-config.yml: # name of this file does not need to match `config/NAME` but should for clarity (could some configs-files might use the same config-paths? (No, and such should NOT be done either))
  scripts/:
    __init__.py: # allows choosing which config-item gets updated (push/pull)?
    pull.py: # gather changes from all destination locations of files
```

## Scripts
- `push [config-name]` (pushes changes to local `config-name` to all "remote" folder locations) (can run on all configs by omitting all arguments)
- `pull [config-name]` (pulls changes from all "remote" folder locations and writes to this local config-name) (can run on all configs by omitting all arguments)
- `refresh [config-name]` (checks for any renamed files and lists them (not smart enough to automatically fix)) (can run on all configs by omitting all arguments)

## Problems
- How to handle/include data files?
  - such as `dragon.txt`?
  - can a generic folder be used in `configs/` to capture multiple items?
    - how to handle presence of **untracked** items in destination folders?
      - write each tracked item to `paths.yml`?
        - what of cases where *every* item in destination folder is important?
          - how to indicate?
            - should `git` just be used for these, since `.gitignore` already exists?
- How to handle different drive labels/machines?
  - Should branches be used or a folder called `devices/` with each having their own `paths.yml`?
- Conflict with Personal Metadata System
  - Especially neglect of dating scheme
- Should other details be included?
- What format should path files follow?
  - shortest possible expressions?
    - (Should a YAML-Schema be made for these?)
  - Full YAML-LD? (Schema.org style JSON-LD objects) (Very verbose)
- Disintegration of Objects
  - Should path-configs be in a separate folder from config-data?
    - how to structure if kept together?

## A Better Config Packaging Format
```yaml
conf/:
  configs/:
    peter-root-config/:
      files/:
        profile.cmd:
          # example "config" file
        dragon.txt:
          # example "data" file, an ascii drawing of a dragon (MUST FIND AUTHOR!!!)
      license:
        # is this really necessary/useful?
        # should configs receive a license, distinct from whatever project they appear in?
      meta.yml:
        # is this necessary/useful?
        # what information would be stored here?
        # should this belong in some separate "note" altogether if the semantics are determined to be important enough?
        # what does this cover that git does not?
        # could probably be used to indicate the full context of some config folder (eg, "why does this exist") or ("where is this used") that the `paths.yml` might not be able to answer
        # might also be used as a catch-all metadata holder, replacing `package.json`, `package-lock.json`, and `handle.yml`
        # though then this must fit some very specific standards for its layout, and might be better named to something more specific
      paths.yml:
        # what if some custom scripting needs to be done/noted for this item?
        # can/should such be expressed declaratively as options within the YAML?
        # is the full expressivity of a script really needed for most items?
        # what if certain "paths" are actually network locations? Should this even be supported?
      readme.md:
        # which kind of documentation would be put here that wouldnt be kept in the target item?
        # could this be useful for things that cannot keep the documentation with themselves?
        # if on a per-project basis, wouldn't that mean spending time finding the right alternate location to keep documentation?
        # could the documentation for some item then be tracked using this system as well, albeit to a different location?
        # or should the documentation be considered its own "config" and tracked separately?
        # if separate, can the items be associated/depend on each other? Should UUID-links be used to indicate the relationship?
        # this is starting to get dangerously close to a full-system-management-system (real pain to actually manage and fulfill)
        # might then be better sought as some sort of app rather than as a framework of scripts
        # and then, really, time dedicated to studying the vocabulary/api, ensuring is handled properly, etc
        # at which point, configs are just a use-case for such a system, and need to split apart into multiple smaller repos instead
        # does this then conflict with a package-management-system?
        # this is not meant for wide-distribution (hence should be *excluded* from most package managers)
        # and needs to "install" to many separate locations, and "receive updates" from those locations often
        # what systems are similar?
  scripts/:
    pull.py:
    push.py:
    refresh.py:
```

## The Dragon File
- How to appropriately cite the author?
- Consider that the author cannot be included in the file itself
  - (at least, not the full author)
- Where should this information be placed?
- The `profile.cmd` file?
- A free-floating `LICENSE` file in the `$USER` directory?
- A specifically-named `dragon-LICENSE` file alongside the `dragon.txt` file?

## FIXME LATER Dragon Citation
- Host Locations
  - [A large collection of ASCII art drawings of dragons and other related mythology ASCII art pictures.](https://www.asciiart.eu/mythology/dragons)
    - [ASCII Art Archive](https://www.asciiart.eu/)
      - (Home > Mythology > Dragons)
  - [DRAGON - ASCII ART](https://ascii.co.uk/art/dragon)
    - [The place for all things textual.](https://ascii.co.uk/)
      - (Home > DRAGON - ASCII ART)
  - [(unnamed email copy)](http://www.afn.org/~afn39695/dias.htm)
    - > Shanaka Dias
      > 
      > Dated: November 3, 1996 through December,1996
    - > Shanaka Dias  
      > edias@alpha1.curtin.edu.au  
      > Curtin University  
      > Perth Western Australia  
- Signature
  - "Art by Shanaka Dias" ("snd")
- Person
  - [Shanaka Dias](https://twitter.com/Shanaka_Dias)
- Research
  - > [so i guess @vitaminwater tracked down and paid Shanaka Dias http://afn.org/~afn39695/dias.htm who made this in 1996](https://twitter.com/asciipr0n/status/1007629897269997568)

## Misc
- [Dragon - Dragons](https://asciiart.website/index.php?art=creatures/dragons)

## Yet Another Layout
- make the `scripts/` their own project (`conf-man`)
- (handle these similarly to `peter-py`)
- then put all the `configs/` into their own "repo" under some "personal" folder
- like this
```yaml
projects/:
  conf-man/: # (the `scripts/` folder) (probably similar to `peter-py`)
  music/: # (example unrelated project) (could configs appear in here? (oh dear... (might even include the `.meta.yml`'s I use... damn)))
  peter/:
    github-profile/: # (my personal "readme profile" repo)
    configs/: # (my actual `configs/` data, as its own repo)
      .git:
      peter-root-profile-windows/:
      license: # CC0? MIT? Probably CC0, no restrictions.
      readme.md: # What information to put here? (TODO: Consult other published config folders)
    secrets/: # ((encrypted) sensitive passwords/logins (use a manager instead? (oh great, yet another project, ugghhhh.....)))
    public/: # (profile images, share-able data)
  peter-py/: # (a similar project) (should also rename this to `personal-py` on github but alas...)
```
- If the scripts are being kept in a separate folder, how to indicate they should be used together?
- Should the `configs/` folder have some `handle.yml` that tells the filesystem how to handle it?
  - such as `useProgram: conf-man`?
    - might then include a [SWID (SoftWare IDentifier)](https://csrc.nist.gov/projects/Software-Identification-SWID) to indicate who `conf-man` is
    - hmm, this is really part of a much larger problem of how to associate programs with data
      - not really acceptable to just go around making an entirely new file-extension just for this one project...

## Example Configs
- [ ] [ESLint rules for all of my personal projects. Feel free to use these conventions :-)](https://github.com/kentcdodds/eslint-config-kentcdodds)
  - Treats it like a Node Package (is actually a node package), just for a single configuration file (also a lot of environment specification)
- [ ] [My .emacs.el file and other personal Emacs goodies](https://github.com/jwiegley/dot-emacs)
  - Offers the most interesting layout for configuration I have seen
    - Has other "config package" (oh fear, lol) as git submodules (interesting! (but requires the configured-software to be able to ignore these files (not always guarantee-able)))
  - Is Emacs so license and documentation often inserted as comments in the config-file itself
- [ ] [Step by step guide from zero to installing and setting up Emacs and Org-roam on Windows 10](https://github.com/nobiot/Zero-to-Emacs-and-Org-roam)
  - What happens when the configuration involves manual steps to restore?
    - Good grief, this is now making me think about using NixOS or GUIX to manage configuration
      - I wonder if any attempts to use these like how I am about to use `conf-man` exist...
- [ ] [🍀 Next-generation, purely functional package manager for the Emacs hacker. ](https://github.com/raxod502/straight.el)
  - An *extension* to a config-management system that changes *how* configs are managed altogether (in terms of in-config description)
  - How to incorporate philosophies such as this?
  - [A use-package declaration for simplifying your .emacs](https://github.com/jwiegley/use-package) also
- [ ] [Centaur Emacs - A Fancy and Fast Emacs Configuration](https://github.com/seagle0128/.emacs.d)
  - Has nice documentation, but is used with software that does not need to worry about handling `.git` in its folder
  - Uses a software license to handle distribution
- [ ] [A Dropbox-like file manager that let you manage your data anywhere it is located](https://github.com/mickael-kerjean/filestash)
  - As an alternative, have the configs tracked by a full-featured database
- [ ] [My personal emacs configuration, hopefully in a sharable state.](https://github.com/jackrusher/dotemacs)
  - Spends some time talking about emacs configuration woes
- Many of these configs also include Docker and NixOS build files
- [ ] [🐲 My Arch Linux config](https://github.com/denisse-dev/dotfiles)
  - Has a useful [`.gitignore`](https://github.com/denisse-dev/dotfiles/blob/master/.gitignore) to look at
    - note the use of `!` ("Do NOT ignore this file") and `*` (ignore everything by default)

## Obscure Repositories
- This stuff really should not be made public, on the virtue it merely pollutes the landscape with unfinished and unstandardized trash

## Move this to Notes you Goof
- Nobody wants to see all this here!

