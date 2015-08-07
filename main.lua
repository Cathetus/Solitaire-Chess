math.randomseed(os.time())

function shuffle(a)
	for i = 1, #a do
		b = math.random(1,#a)
		a[b], a[i] = a[i], a[b]
	end
	return a
end

function love.load()--loading the images and setting up the board
	love.window.setMode(360,360)

	ls = love.graphics.newImage("assets/light_square.png")
	ds = love.graphics.newImage("assets/dark_square.png")
	
	p = love.graphics.newImage("assets/pawn.png")
	n = love.graphics.newImage("assets/knight.png")
	b = love.graphics.newImage("assets/bishop.png")
	r = love.graphics.newImage("assets/rook.png")
	q = love.graphics.newImage("assets/queen.png")
	k = love.graphics.newImage("assets/king.png")
	
	
	tiles = {ls,ds,ls,ds,ls,ds,ls,ds,ls,ds,ls,ds,ls,ds,ls,ds}
	board = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,p,p,n,n,b,b,r,r,q,k}
	shuffle(board)
	
end

function love.keypressed(key, isrepeat)--reset the board
	if key == " " then--space key
		shuffle(board)
	end
end

function love.draw()--drawing the board
	x = 1
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
