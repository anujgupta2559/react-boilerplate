SOURCE=$1
TARGET=$2


input=$1
 
if [[ $input = *Hub ]]
then
	echo "ends with Hub"
else
	echo "No match"
fi

exit 0

# few params validation
if [ "$SOURCE" == "" ] || [ "$TARGET" == "" ];
then
    echo "error: SOURCE and TARGET are required"
    exit 1
else
    echo  "SOURCE is $SOURCE, Target is $TARGET"
fi;

# target branch must not any user defined branch
if [[ "$TARGET" != @(main|staging|develop|pre_develop) ]]; then echo "error: The target branch can not equal {${TARGET}}";fi;

# source branch must not equals main branch
if [ "$SOURCE" == "main" ]; then echo "error: SOURCE branch can not equal to {main}" && exit 1; fi;

# A user-defined branch (all the branches except main, staging, develop, and pre_develop) must have the base branch of pre_develop
if [[ "$SOURCE" != @(main|staging|develop|pre_develop) ]] && [ "$TARGET" != "pre_develop" ]; then echo "error: The branch {${SOURCE}} need to merge with pre_develop first."; fi;

# if source is pre_develop, target must be develop or staging
if [ "${SOURCE}" == 'pre_develop' ] && [[ "$TARGET" != @(develop|staging) ]]; then echo "error: The branch {${SOURCE}} should target to {develop|staging}"; fi;

# if source is develop, target must be staging or main
if [ "${SOURCE}" == 'develop' ] && [[ "$TARGET" != @(staging|main) ]]; then echo "error: The branch {${SOURCE}} should target to {staging|main}"; fi;

# if source is develop, target must be staging or main
if [ "${SOURCE}" == 'staging' ] && [[ "$TARGET" != "main" ]]; then echo "error: The branch {${SOURCE}} should target to {main}"; fi;