
set -e

echo "Testing role syntax"
ansible-playbook -i tests/inventory tests/test.yml --verbose --syntax-check

rm -f /tmp/.foobar.touchstone

echo "Testing role functionality"
ansible-playbook -i tests/inventory -e expected=False --verbose tests/test.yml

echo "Testing role idempotence"
OUTPUT="$(mktemp -p '' $(basename $0)_XXXX)"
trap "rm -f $OUTPUT" EXIT
ansible-playbook -i tests/inventory -e expected=True --verbose tests/test.yml \
    | tee "$OUTPUT"
cat "$OUTPUT" \
    | grep -q 'changed=0.*failed=0' \
            && (echo 'Idempotence test: pass' && exit 0) \
            || (echo 'Idempotence test: fail' && exit 1)
