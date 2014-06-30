require 'sinatra'

class FishApp < Sinatra::Base

  def initialize
    super
    @fish = [
      {
        name: "Trout",
        scientific_name: "Salmonidae",
        habitat: "freshwater",
        img: "http://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Salmo_trutta.jpg/220px-Salmo_trutta.jpg",
        paragraph: "Trout is the name for a number of species of freshwater fish belonging to the genera Oncorhynchus, Salmo and Salvelinus, all of the subfamily Salmoninae of the family Salmonidae. The word trout is also used as part of the name of some non-salmonid fish such as Cynoscion nebulosus, the spotted seatrout or speckled trout.
  Trout are closely related to salmon and char (or charr): species termed salmon and char occur in the same genera as do trout (Oncorhynchus - Pacific salmon and trout, Salmo - Atlantic salmon and various trout, Salvelinus - char and trout).
  Most trout such as Lake trout live in freshwater lakes and/or rivers exclusively, while there are others such as the Rainbow trout which may either live out their lives in fresh water, or spend two or three years at sea before returning to fresh water to spawn, a habit more typical of salmon. A rainbow trout that spends time in the ocean is called a steelhead.
  Trout are an important food source for humans and wildlife including brown bears, birds of prey such as eagles, and other animals. They are classified as oily fish.[1]",
        wiki: "http://en.wikipedia.org/wiki/Trout",
      },
      {
        name: "Catfish",
        scientific_name: "Siluriformes",
        habitat: "freshwater",
        img: "http://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Ameiurus_melas_by_Duane_Raver.png/240px-Ameiurus_melas_by_Duane_Raver.png",
        paragraph: "Catfishes (order Siluriformes) are a diverse group of ray-finned fish. Named for their prominent barbels, which resemble a cat's whiskers, catfish range in size and behavior from the heaviest and longest, the Mekong giant catfish from Southeast Asia and the second longest, the wels catfish of Eurasia, to detritivores (species that eat dead material on the bottom), and even to a tiny parasitic species commonly called the candiru, Vandellia cirrhosa. There are armour-plated types and there are also naked types, neither having scales. Despite their name, not all catfish have prominent barbell. Members of the Siluriformes order are defined by features of the skull and swimbladder. Catfish are of considerable commercial importance; many of the larger species are farmed or fished for food. Many of the smaller species, particularly the genus Corydoras, are important in the aquarium hobby. Many catfish are nocturnal,[2][3] but others (many Auchenipteridae) are crepuscular or diurnal (most Loricariidae or Callichthyidae for example).",
        wiki: "http://en.wikipedia.org/wiki/Catfish",
      },
      {
        name: "Betta",
        scientific_name: "Osphronemidae",
        habitat: "freshwater",
        img: "http://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Betta_albimarginata_060311_8.jpg/250px-Betta_albimarginata_060311_8.jpg",
        paragraph: "Betta /ˈbɛtə/ is a large genus of small, often colorful, freshwater ray-finned fishes in the gourami family (Osphronemidae).[1] By far the best known Betta species, however, is B. splendens, the Siamese fighting fish.",
        wiki: "http://en.wikipedia.org/wiki/Betta",
      }]
  end

  get "/" do
    erb :root
  end

  post "/" do
    new_fish = {name: params[:new_item]}
    @fish.push(new_fish)
    redirect "/"
  end


  get "/fish/:index" do
    @fish_data = @fish[params[:index].to_i]
    erb :template, {:locals => {:fish_data => @fish_data}}
  end

end
