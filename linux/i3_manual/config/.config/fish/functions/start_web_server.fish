function start_web_server
    brew services start php71; and brew services start nginx
end

function restart_web_server
    brew services restart php71; and brew services restart nginx
end

function stop_web_server
    brew services stop nginx; and brew services stop php71
end
