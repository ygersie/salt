# Import python libs
import re
import operator as py_operator
from distutils.version import LooseVersion, StrictVersion
import salt.exceptions


def append_str_to_list(list_obj, string):
    """
    Appends a string to each element of a list
    """

    return ["{0}{1}".format(elem, string) for elem in list_obj]


def re_replace(pattern, replacement, string):
    return re.sub(pattern, replacement, string)


def re_match(pattern, string):
    return re.match(pattern, string)


def version_compare(value, operator, version, strict=False):
    """Perform a version comparison on a value"""
    op_map = {
        '==': 'eq', '=': 'eq', 'eq': 'eq',
        '<': 'lt', 'lt': 'lt',
        '<=': 'le', 'le': 'le',
        '>': 'gt', 'gt': 'gt',
        '>=': 'ge', 'ge': 'ge',
        '!=': 'ne', '<>': 'ne', 'ne': 'ne'
    }

    if strict:
        Version = StrictVersion
    else:
        Version = LooseVersion

    if operator in op_map:
        operator = op_map[operator]
    else:
        raise salt.exceptions.CommandExecutionError('Invalid operator type')

    try:
        method = getattr(py_operator, operator)
        return method(Version(str(value)), Version(str(version)))
    except Exception as e:
        raise salt.exceptions.CommandExecutionError('Version comparison: %s' % e)


def ptr_record(ip):
    """
    Create PTR record from IPv4 address
    """
    splitted = ip.split('.')
    if len(splitted) != 4:
        raise salt.exceptions.CommandExecutionError("invalid IPv4 address")

    try:
        if list(filter(lambda octet: int(octet) < 0 or int(octet) > 255, splitted)):
            raise salt.exceptions.CommandExecutionError("invalid IPv4 address")
    except Exception:
        raise salt.exceptions.CommandExecutionError("invalid IPv4 address")

    splitted.reverse()

    return "{}.in-addr.arpa.".format('.'.join(splitted))
