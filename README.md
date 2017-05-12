# guetzlify

Recompress (progressive) .jpg and .png images in a folder with guetzli.

## Configuration

In `guetzlify.sh` specify path to `guetzli` and `convert` program and set your desired `quality`.

## Notes

Before using this script backup your images. guetzlify overwrites them without asking. Maybe you're unsatisfied with compression results and want to play around with `quality` setting, you need your original files again.

## Usage

For images in a directory, edit `dir` in `guetzlify_rec.sh` and run it.

For single files try `guetzlify.sh $FILENAME`.

