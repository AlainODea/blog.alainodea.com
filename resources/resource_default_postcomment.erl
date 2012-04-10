%% @author author <author@example.com>
%% @copyright YYYY author.
%% @doc Example webmachine_resource.

-module(resource_default_postcomment).
-export([event/2]).

-include_lib("zotonic.hrl").

event({submit, postcomment, _TriggerId, _TargetId}, Context) ->
	?DEBUG(z_context:get_q_all(Context)),
    {Html, Context1} = z_template:render_to_iolist("_article_comments.tpl",[], Context),
    z_render:update("comments", Html, Context1).