Touchstone
===========

Ansible role to easily make sets of plays, roles or tasks idempotent.
This is critical for some sequence declarations.  For example
if one role does partitioning, and another does formatting.  Re-applying
that sequence in the future stands a good chance of wrecking your data.

Requirements
------------

Same as stock Ansible 2.3+

Role Variables
--------------

``touch_touchstone``:
   When true, mark the end-state or completion identified by ``stone_name``.

``stone_name``:
   Optional, identification string to use when multiple end-states must be
   tracked.  For example multiple playbooks.  Defaults to the base, directory
   name of the current playbook.

``touchstone_filepath``:
   Directory path where the touchstone ``stone_name`` will exist.  Must
   be a permanent and writable directory for ``ansible_user``, i.e. not
   a ``tmpdir`` based ``/tmp``.

``stone_touched``:
   A boolean value, set during the role to reflect the current touchstone
   state.  When ``True``, it indicates the stone was touched at least once
   in the past.

Dependencies
------------

A systemd-based machine with a unique /etc/machine-id.

Example Playbook
----------------

::

    - hosts: all
      roles:
         - cevich.parallel_git_repos

License
-------

    Easily make sets of plays, roles or tasks idempotent.
    Copyright (C) 2017  Christopher C. Evich

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.


Author Information
------------------

Causing trouble and inciting mayhem with Linux since Windows 98


Continuous Integration
-----------------------

Travis CI: |ci_status|

.. |ci_status| image:: https://travis-ci.org/cevich/touchstone.svg?branch=master
               :target: https://travis-ci.org/cevich/touchstone
