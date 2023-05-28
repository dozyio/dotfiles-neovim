local get_lsp_client_all = function (msg)
    msg = msg or 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0,'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
        return msg
    end

    local activeClients = {}
    for _,client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes,buf_ft) ~= -1 then
            table.insert(activeClients, client.name)
        end
    end

    if (#(activeClients) > 0)
    then
        return table.concat(activeClients, ", ")
    end

    return msg
end

return {
    get_lsp_client_all = get_lsp_client_all
}
