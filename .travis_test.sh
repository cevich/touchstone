
set -e

no_foo() {
    echo "Verifying test marker file absence"
    stat /tmp/foobar || true
}

echo "Testing role syntax"
no_foo
ansible-playbook -i tests/inventory tests/test.yml --verbose --syntax-check

echo "Testing role functionality"
no_foo
ansible-playbook -i tests/inventory tests/test.yml

echo "Testing role idempotence"
no_foo
ansible-playbook -i tests/inventory tests/again.yml \
    | grep -q 'changed=0.*failed=0' \
            && (echo 'Idempotence test: pass' && exit 0) \
            || (echo 'Idempotence test: fail' && exit 1)
no_foo
