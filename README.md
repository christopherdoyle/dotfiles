https://www.atlassian.com/git/tutorials/dotfiles

## Required SSH config (w/ cloudflared installed)

Linux:

```
Host <ssh site root>
  ProxyCommand /usr/local/bin/cloudflared access ssh --hostname %h
```

Windows:

```
Host <ssh site root>
  ProxyCommand cloudflared access ssh --hostname %h
```

