function word = encoder(input, g)
    word = fliplr(mod(conv(fliplr(input), fliplr(g)), 2));
end