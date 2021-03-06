// Copyright (c) 2017 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

# Check whether the XML sequence contains only a single element.
#
# + return - Boolean flag indicating whether the XML sequence contains only a single element
public extern function xml::isSingleton() returns (boolean);

# Check whether the XML sequence is empty.
#
# + return - Boolean flag indicating whether the XML sequence is empty
public extern function xml::isEmpty() returns (boolean);

# Get all the items that are of element type in an XML sequence.
#
# + return - All the elements-type items in the given XML sequence
public extern function xml::elements() returns (xml);

# Get all the items that are of element type, and matches the given qualified name, in an XML sequence.
#
# + qname - Qualified name of the element
# + return - All the elements-type items in the given XML sequence, that matches the qualified name
public extern function xml::select(string qname) returns (xml);

# Get the type of a XML as a string. If the XML is singleton, type can be one of 'element', 'text', 'comment' or 'pi'.
# Returns an empty string if the XML is not a singleton.
#
# + return - Type of the XML as a string
public extern function xml::getItemType() returns (string);

# Get the fully qualified name of the element as a string. Returns an empty string if the XML is not a singleton.
#
# + return - Qualified name of the XML as a string
public extern function xml::getElementName() returns (string);

# Get the text value of a XML. If the XML is a sequence, concatenation of the text values of the members of the
# sequence is returned. If the XML is an element, then the text value of the sequence of children is returned. If
# the XML is a text item, then the text is returned. Otherwise, an empty string is returned.
#
# + return - Text value of the xml
public extern function xml::getTextValue() returns (string);

# Set the children of an XML if its a singleton. An Error otherwise. Any existing children will be removed.
#
# + children - children
public extern function xml::setChildren(xml children);

# Make a deep copy of an XML.
#
# + return - A Copy of the XML
public extern function xml::copy() returns (xml);

# Strips any text items from an XML sequence that are all whitespace.
#
# + return - Striped sequence
public extern function xml::strip() returns (xml);

# Slice and return a subsequence of the an XML sequence.
#
# + startIndex - Start index, inclusive
# + endIndex - End index, exclusive
# + return - Sliced sequence
public extern function xml::slice(int startIndex, int endIndex) returns (xml);

# Sets the attributes to the provided attributes map.
#
# + attributes - Attributes map
public extern function xml::setAttributes(map attributes);

# Converts a XML object to a JSON representation.
#
# + options - xmlOptions struct for XML to JSON conversion properties
# + return - JSON representation of the given XML
public extern function xml::toJSON(record {
                                         string attributePrefix = "@",
                                         boolean preserveNamespaces = true,
                                     } options) returns (json);

# Searches in children recursively for elements matching the qualified name and returns a sequence containing them
# all. Does not search within a matched result.
#
# + qname - Qualified name of the element
# + return - All the descendants that matches the given qualified name, as a sequence
public extern function xml::selectDescendants(string qname) returns (xml);

# Remove an attribute from an XML.
#
# + qname - Qualified name of the attribute
public extern function xml::removeAttribute(string qname);

documentation {
    Append children to an XML if its an element type XML. Error otherwise. 
    New children will be appended at the end of the existing children.

    P{{children}} children
}
public extern function xml::appendChildren(xml children);

documentation {
    Remove children matching the given name from an XML. This operation has no effect
    if the XML is not an element type XML.

    P{{qname}} Namespace qualified name of the children to be removed
}
public extern function xml::removeChildren(string qname);
