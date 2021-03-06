%% @author Marc Worrell <marc@worrell.nl>
%% @copyright 2010 Marc Worrell
%% @doc 'last' filter, return the last element of a list or the last character of a string

%% Copyright 2010 Marc Worrell
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%% 
%%     http://www.apache.org/licenses/LICENSE-2.0
%% 
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.

-module(filter_last).
-export([last/2]).

-include("zotonic.hrl").

last(undefined, _Context) ->
    undefined;
last(Input, _Context) when is_binary(Input) ->
    case size(Input) of
        0 -> Input;
        N ->
            Offset = N - 1,
            <<_:Offset/binary, Byte>> = Input,
            Byte
    end;
last(Other, Context) ->
    case erlydtl_runtime:to_list(Other, Context) of
        [] -> <<>>;
        L -> lists:last(L)
    end.
