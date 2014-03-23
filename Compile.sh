#Set patches directory
patchDir="hardware/ste/patches"

#Patch
echo Patching...
for d in $(ls $patchDir | grep -v FM);
do
  for f in $(ls $patchDir"/"$d | grep .patch);
  do
    git apply -p1 --verbose --ignore-space-change --ignore-whitespace < $patchDir"/"$d"/"$f
    RETVAL=$?
    if [ $RETVAL -ne 0 ]; then
	  echo "Error $RETVAL with patch $d/$f"
	  exit $RETVAL
    fi
  done
done

device="$1"
#Compile
./Recompile$device.sh
