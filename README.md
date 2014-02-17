## For mounting an Android 4+ device

Android 4+ uses a FUSE filesystem, so is not mounted like previous versions of android. This script uses go-mtpfs to mount the phone and SD card storage.

Setup:

- You'll need the go-mtpfs program. Check with ```apt-cache policy go-mptfs```

    - If you don't have it, you can get it with (warning: add the ppa and install from webupd8team at your own risk)
		
				add-apt-repository ppa:webupd8team/unstable
				apt-get update
				apt-get install go-mtpfs

- Create the folder /media/android-fuse 

		mkdir /media/android-fuse

- Take ownership of it/make it writable in some other way (a folder will be created here for the device)

		chown $USER /media/android-fuse


Usage:

		mount-android-fuse-fs.sh foldername

where foldername is the name of the folder the device files should be mounted in. This doesn't have to exist when the script is run, if it doesn't it will be created.
