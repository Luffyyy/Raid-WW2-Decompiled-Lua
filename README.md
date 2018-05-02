# Raid-WW2-Lua

Issues fixed by hand(present in the repo):

```lua
X.Y = function(self)

end
```

Regex: 
```(\w+).(\w+) = function \(self,*\s*```

Replace with: 
```function $1:$2(```
