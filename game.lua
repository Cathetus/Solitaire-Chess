game = {}

--Load the images & setup the board
function game.load()
	t1 = love.graphics.newImage("assets/tile1.png")
	t2 = love.graphics.newImage("assets/tile2.png")
	
	p = love.graphics.newImage("assets/pawn.png")
	n = love.graphics.newImage("assets/knight.png")
	b = love.graphics.newImage("assets/bishop.png")
	r = love.graphics.newImage("assets/rook.png")
	q = love.graphics.newImage("assets/queen.png")
	k = love.graphics.newImage("assets/king.png")
	
	tiles = {t1,t2,t1,t2,t1,t2,t1,t2,t1,t2,t1,t2,t1,t2,t1,t2}
	board = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,p,p,n,n,b,b,r,r,q,k}
end

--Draw the board
function game.draw()
	local x = 1
	for i = 1, 4 do
		for j = 1, 4 do
			love.graphics.draw(tiles[i+j-1], j*90-90, i*90-90)
			if board[x] ~= 0 then
				love.graphics.draw(board[x], j*90-90, i*90-90)
			end
			x = x + 1
		end
	end
end

--Shuffle the board
function game.shuffle(a)
	for i = 1, #a do
		local b = math.random(1,#a)
		a[b], a[i] = a[i], a[b]
	end
	return a
end
