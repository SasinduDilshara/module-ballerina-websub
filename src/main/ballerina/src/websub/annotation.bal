// Copyright (c) 2018 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

import ballerina/http;

///////////////////////////
/// Service Annotations ///
///////////////////////////
# Configuration for a WebSubSubscriber service.
#
# + endpoints - Array of endpoints the service would be attached to
# + path - Path of the WebSubSubscriber service
# + subscribeOnStartUp - Boolean indicating whether a subscription request is expected to be sent on start up
# + target - The `string` resource URL for which discovery will be initiated to identify the hub and topic,
#               or a tuple `[hub, topic]` representing a discovered hub and a topic
# + leaseSeconds - The period for which the subscription is expected to be active
# + secret - The secret to be used for authenticated content distribution
# + callback - The callback to use when registering, if unspecified host:port/path will be used
# + publisherClientConfig - The configuration for the discovery client, to use if a resource URL is specified
# + hubClientConfig - The configuration for the hub client used to interact with the discovered/specified hub
public type SubscriberServiceConfiguration record {|
    Listener?[] endpoints = [];
    string path = "";
    boolean subscribeOnStartUp = false;
    string|[string, string] target?;
    int leaseSeconds = 0;
    string secret = "";
    string callback = "";
    http:ClientEndpointConfig publisherClientConfig?;
    http:ClientEndpointConfig hubClientConfig?;
|};

# WebSub Subscriber Configuration for the service, indicating subscription related parameters.
public annotation SubscriberServiceConfiguration SubscriberServiceConfig on service;
