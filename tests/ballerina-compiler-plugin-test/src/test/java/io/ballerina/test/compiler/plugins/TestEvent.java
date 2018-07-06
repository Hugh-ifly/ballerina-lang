/*
 *  Copyright (c) 2018, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
 *
 *  WSO2 Inc. licenses this file to you under the Apache License,
 *  Version 2.0 (the "License"); you may not use this file except
 *  in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing,
 *  software distributed under the License is distributed on an
 *  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 *  KIND, either express or implied.  See the License for the
 *  specific language governing permissions and limitations
 *  under the License.
 */
package io.ballerina.test.compiler.plugins;

import java.util.Objects;

/**
 * An event fired by compiler plugin extensions.
 */
class TestEvent {

    enum Kind {
        PKG_NODE("package"),
        SERVICE_ANN("service"),
        RESOURCE_ANN("resource"),
        CONNECTOR_ANN("connector"),
        ACTION_ANN("action"),
        STRUCT_ANN("struct"),
        TYPEDEF_ANN("struct"),
        ENUM_ANN("enum"),
        FUNC_ANN("function"),
        VARIAVLE_ANN("variable"),
        ANNOTATION_ANN("annotation"),
        TRANSFORM_ANN("transformer"),
        CODE_GEN("codegen");

        String name;

        Kind(String name) {
            this.name = name;
        }
    }

    Kind kind;
    String nodeName;
    int noOfAnnotations;


    TestEvent(Kind kind, String nodeName, int noOfAnnotations) {
        this.kind = kind;
        this.nodeName = nodeName;
        this.noOfAnnotations = noOfAnnotations;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }

        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        TestEvent testEvent = (TestEvent) o;
        return noOfAnnotations == testEvent.noOfAnnotations &&
                kind == testEvent.kind &&
                Objects.equals(nodeName, testEvent.nodeName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(kind, nodeName, noOfAnnotations);
    }
}