import React, { useState, useEffect, useMemo } from 'react';

// --- Helper Components ---
const FishIcon = ({ className = 'w-6 h-6' }) => (
    <svg className={className} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M6.7,16.2c-1.9-0.1-3.6,0.6-4.2,1.9c-0.6,1.3,0.1,2.5,1.7,3.1c1.6,0.6,3.2,0.1,4-1.1c0.8-1.2,0.5-2.6-0.8-3.4 C6.9,16.4,6.8,16.3,6.7,16.2z"/><path d="M21.6,8.9c-0.2-1.4-1.1-2.6-2.5-3.1c-1.4-0.5-2.9-0.2-4,0.7c-1.1,0.9-1.6,2.3-1.3,3.7c0.4,1.4,1.5,2.5,2.9,2.8 c0.3,0.1,0.6,0.1,0.9,0.1c1,0,2-0.5,2.6-1.3C21.2,11.1,21.7,10,21.6,8.9z"/><path d="M19.1,12.5c-1.2,0-2.3,0.7-2.8,1.8c-0.5,1.1-0.2,2.4,0.7,3.2c0.9,0.8,2.2,0.9,3.2,0.2c1-0.7,1.5-1.9,1.2-3 c-0.2-0.9-0.9-1.7-1.8-2C19.4,12.5,19.2,12.5,19.1,12.5z"/><path d="M11.6,12.6c-0.2-0.4-0.4-0.7-0.7-1c-1.2-1.2-2.9-1.7-4.5-1.4c-1.6,0.3-2.9,1.3-3.6,2.7c-0.7,1.4-0.5,3,0.5,4.3 c1,1.3,2.5,2,4.1,2c0.4,0,0.8-0.1,1.2-0.2c1.7-0.5,2.9-1.9,3.2-3.6C12,14.5,11.9,13.5,11.6,12.6z"/></svg>
);
const TrashIcon = ({ className = 'w-5 h-5' }) => (
    <svg className={className} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg>
);
const PlusIcon = ({ className = 'w-5 h-5' }) => (
    <svg className={className} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>
);


// --- Main App Component ---
export default function App() {
    // --- Fish Databases ---
    const freshwaterFishDatabase = useMemo(() => [
        { name: 'African Dwarf Frog', length: 2.5 }, { name: 'Amano Shrimp', length: 2.0 }, { name: 'Amazon Puffer', length: 3.0 }, { name: 'Angelfish', length: 6.0 }, { name: 'Apistogramma agassizii', length: 3.0 }, { name: 'Apistogramma cacatuoides', length: 3.5 }, { name: 'Betta (Siamese Fighting Fish)', length: 3.0 }, { name: 'Black Ghost Knife', length: 14.0 }, { name: 'Black Molly', length: 4.0 }, { name: 'Blood Parrot Cichlid', length: 8.0 }, { name: 'Celestial Pearl Danio', length: 1.0 }, { name: 'Cherry Barb', length: 2.0 }, { name: 'Chili Rasbora', length: 0.75 }, { name: 'Clown Killifish', length: 1.5 }, { name: 'Clown Loach', length: 7.0 }, { name: 'Corydoras (Panda)', length: 2.0 }, { name: 'Corydoras (Pygmy)', length: 1.0 }, { name: 'Denison Barb (Roseline Shark)', length: 6.0 }, { name: 'Discus', length: 8.0 }, { name: 'Dwarf Pea Puffer', length: 1.0 }, { name: 'Endler\'s Livebearer', length: 1.5 }, { name: 'Fire Eel', length: 20.0 }, { name: 'Firemouth Cichlid', length: 6.0 }, { name: 'German Blue Ram', length: 2.5 }, { name: 'Ghost Shrimp', length: 1.5 }, { name: 'Goldfish (Common)', length: 10.0 }, { name: 'Gourami (Dwarf)', length: 3.0 }, { name: 'Gourami (Honey)', length: 2.0 }, { name: 'Guppy', length: 2.0 }, { name: 'Harlequin Rasbora', length: 1.75 }, { name: 'Kuhli Loach', length: 3.5 }, { name: 'Molly', length: 4.0 }, { name: 'Oscar', length: 12.0 }, { name: 'Otocinclus Catfish', length: 2.0 }, { name: 'Platy', length: 2.5 }, { name: 'Pleco (Bristlenose)', length: 5.0 }, { name: 'Pleco (Common)', length: 15.0 }, { name: 'Rainbowfish (Boeseman\'s)', length: 4.0 }, { name: 'Rosy Barb', length: 4.0 }, { name: 'SAE (Siamese Algae Eater)', length: 6.0 }, { name: 'Swordtail', length: 4.5 }, { name: 'Tetra (Cardinal)', length: 2.0 }, { name: 'Tetra (Ember)', length: 0.8 }, { name: 'Tetra (Neon)', length: 1.5 }, { name: 'Tetra (Rummy Nose)', length: 2.0 }, { name: 'Tire Track Eel', length: 15.0 }, { name: 'Zebra Danio', length: 2.0 }
    ].sort((a, b) => a.name.localeCompare(b.name)), []);

    const saltwaterFishDatabase = useMemo(() => [
        { name: 'Banggai Cardinalfish', length: 3.0 }, { name: 'Bicolor Blenny', length: 4.0 }, { name: 'Blue Chromis', length: 4.0 }, { name: 'Blue/Green Reef Chromis', length: 3.0 }, { name: 'Blue Tang (Hippo)', length: 10.0 }, { name: 'Carpenter\'s Flasher Wrasse', length: 3.0 }, { name: 'Chalk Basslet', length: 3.0 }, { name: 'Cleaner Wrasse', length: 4.0 }, { name: 'Clownfish (Ocellaris)', length: 3.0 }, { name: 'Clownfish (Percula)', length: 3.0 }, { name: 'Copperband Butterflyfish', length: 8.0 }, { name: 'Coral Beauty Angelfish', length: 4.0 }, { name: 'Diamond Goby', length: 6.0 }, { name: 'Dogface Puffer', length: 12.0 }, { name: 'Firefish', length: 3.0 }, { name: 'Flame Angelfish', length: 4.0 }, { name: 'Flame Hawkfish', length: 4.0 }, { name: 'Foxface Lo', length: 7.0 }, { name: 'Green Chromis', length: 3.0 }, { name: 'Green Mandarinfish', length: 3.0 }, { name: 'Kole Tang', length: 7.0 }, { name: 'Lawnmower Blenny', length: 5.0 }, { name: 'Longnose Hawkfish', length: 4.0 }, { name: 'Lyretail Anthias', length: 5.0 }, { name: 'McCosker\'s Flasher Wrasse', length: 3.0 }, { name: 'Melanurus Wrasse', length: 5.0 }, { name: 'Midas Blenny', length: 5.0 }, { name: 'Orchid Dottyback', length: 3.0 }, { name: 'Pajama Cardinalfish', length: 3.0 }, { name: 'Pink Skunk Clownfish', length: 4.0 }, { name: 'Royal Dottyback', length: 3.0 }, { name: 'Royal Gramma', length: 3.0 }, { name: 'Six Line Wrasse', length: 3.0 }, { name: 'Snowflake Eel', length: 24.0 }, { name: 'Spotted Mandarin', length: 3.0 }, { name: 'Tailspot Blenny', length: 2.5 }, { name: 'Tomini Tang', length: 6.0 }, { name: 'Valentini Puffer', length: 4.0 }, { name: 'Watchman Goby (Yellow)', length: 3.0 }, { name: 'Yellow Coris Wrasse', length: 5.0 }, { name: 'Yellow Tang', length: 8.0 }, { name: 'Yellowtail Damselfish', length: 3.0 }, { name: 'Zebra Moray Eel', length: 30.0 }
    ].sort((a, b) => a.name.localeCompare(b.name)), []);

    // --- State Variables ---
    const [aquariumType, setAquariumType] = useState(null); // 'freshwater' or 'saltwater'
    const [fishDatabase, setFishDatabase] = useState([]);
    const [tankSize, setTankSize] = useState(30);
    const [addedFish, setAddedFish] = useState([]);
    const [selectedFishName, setSelectedFishName] = useState('');
    const [quantity, setQuantity] = useState(1);
    const [totalInches, setTotalInches] = useState(0);
    const [stockingLevel, setStockingLevel] = useState(0);
    const [totalFishCount, setTotalFishCount] = useState(0);
    
    // Custom fish states
    const [customFishName, setCustomFishName] = useState('');
    const [customFishLength, setCustomFishLength] = useState('');
    const [customFishQuantity, setCustomFishQuantity] = useState(1);

    // --- Effects ---
    useEffect(() => {
        if (aquariumType === 'freshwater') {
            setFishDatabase(freshwaterFishDatabase);
            setSelectedFishName(freshwaterFishDatabase[0]?.name || '');
        } else if (aquariumType === 'saltwater') {
            setFishDatabase(saltwaterFishDatabase);
            setSelectedFishName(saltwaterFishDatabase[0]?.name || '');
        }
    }, [aquariumType, freshwaterFishDatabase, saltwaterFishDatabase]);

    useEffect(() => {
        const currentTotalInches = addedFish.reduce((sum, fish) => sum + (fish.length * fish.quantity), 0);
        setTotalInches(currentTotalInches);
        const currentTotalFishCount = addedFish.reduce((sum, fish) => sum + fish.quantity, 0);
        setTotalFishCount(currentTotalFishCount);
        if (tankSize > 0) {
            setStockingLevel((currentTotalInches / tankSize) * 100);
        } else {
            setStockingLevel(0);
        }
    }, [addedFish, tankSize]);

    // --- Event Handlers ---
    const handleAddFish = () => {
        if (quantity < 1 || !selectedFishName) return;
        const fishToAdd = fishDatabase.find(f => f.name === selectedFishName);
        if (!fishToAdd) return;
        addFishToTank(fishToAdd, quantity);
        setQuantity(1);
    };

    const handleAddCustomFish = () => {
        const length = parseFloat(customFishLength);
        if (customFishQuantity < 1 || !customFishName.trim() || isNaN(length) || length <= 0) {
            return;
        }
        const customFish = { name: customFishName.trim(), length };
        addFishToTank(customFish, customFishQuantity);
        
        setCustomFishName('');
        setCustomFishLength('');
        setCustomFishQuantity(1);
    };
    
    const addFishToTank = (fish, qty) => {
        setAddedFish(prevFish => {
            const existingFishIndex = prevFish.findIndex(f => f.name === fish.name);
            if (existingFishIndex > -1) {
                const updatedFish = [...prevFish];
                updatedFish[existingFishIndex].quantity += qty;
                return updatedFish;
            } else {
                return [...prevFish, { ...fish, quantity: qty, id: fish.name }];
            }
        });
    };

    const handleRemoveFishGroup = (fishId) => {
        setAddedFish(addedFish.filter(fish => fish.id !== fishId));
    };

    // --- UI Helper Functions ---
    const getStockingInfo = () => {
        if (stockingLevel <= 80) return { color: 'bg-blue-500', label: 'Understocked', textColor: 'text-blue-400' };
        if (stockingLevel <= 100) return { color: 'bg-green-500', label: 'Good', textColor: 'text-green-400' };
        if (stockingLevel <= 120) return { color: 'bg-yellow-500', label: 'Slightly Overstocked', textColor: 'text-yellow-400' };
        return { color: 'bg-red-500', label: 'Overstocked', textColor: 'text-red-400' };
    };
    const stockingInfo = getStockingInfo();

    // --- Render Logic ---
    if (!aquariumType) {
        return (
            <div className="bg-gray-900 text-gray-200 min-h-screen font-sans flex items-center justify-center p-4">
                <div className="w-full max-w-md mx-auto bg-gray-800 rounded-2xl shadow-lg p-8 text-center border border-gray-700">
                    <FishIcon className="w-16 h-16 mx-auto text-yellow-400 mb-4" />
                    <h1 className="text-2xl font-bold text-gray-100 mb-2">Welcome to the Aquarium Calculator</h1>
                    <p className="text-gray-400 mb-6">Please select your aquarium type to begin.</p>
                    <div className="flex justify-center space-x-4">
                        <button onClick={() => setAquariumType('freshwater')} className="px-6 py-3 bg-blue-600 text-white font-semibold rounded-lg hover:bg-blue-700 transition shadow-md">Freshwater</button>
                        <button onClick={() => setAquariumType('saltwater')} className="px-6 py-3 bg-yellow-500 text-gray-900 font-semibold rounded-lg hover:bg-yellow-600 transition shadow-md">Saltwater</button>
                    </div>
                </div>
            </div>
        );
    }

    return (
        <div className="bg-gray-900 text-gray-200 min-h-screen font-sans flex items-center justify-center p-4">
            <div className="w-full max-w-4xl mx-auto bg-gray-800 rounded-2xl shadow-lg p-6 md:p-8 border border-gray-700">
                <div className="text-center mb-6">
                    <div className="flex justify-center items-center gap-4">
                       <FishIcon className="w-12 h-12 text-yellow-400" />
                       <div>
                           <h1 className="text-3xl font-bold text-gray-100">Aquarium Stocking Calculator</h1>
                           <p className="text-gray-400 mt-1">Using the "1 inch of fish per gallon" rule for your <span className="font-semibold capitalize text-yellow-400">{aquariumType}</span> tank.</p>
                       </div>
                    </div>
                     <button onClick={() => setAquariumType(null)} className="text-sm text-yellow-500 hover:underline mt-2">Change tank type</button>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
                    {/* Left Column: Inputs */}
                    <div className="flex flex-col space-y-4">
                        <div>
                            <label htmlFor="tankSize" className="block text-sm font-medium text-gray-400 mb-1">Aquarium Size (Gallons)</label>
                            <input type="number" id="tankSize" value={tankSize} onChange={e => setTankSize(e.target.value === '' ? '' : Number(e.target.value))} className="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg focus:ring-2 focus:ring-yellow-500 focus:border-yellow-500"/>
                        </div>
                        
                        <div className="p-4 border border-gray-700 rounded-lg bg-gray-800/50">
                            <h3 className="font-semibold text-gray-200 mb-2">Add from List</h3>
                            <div className="flex items-stretch space-x-2">
                                <select id="fishSelect" value={selectedFishName} onChange={e => setSelectedFishName(e.target.value)} className="flex-grow w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg focus:ring-2 focus:ring-yellow-500 focus:border-yellow-500">
                                    {fishDatabase.map(fish => (<option key={fish.name} value={fish.name}>{fish.name} ({fish.length}")</option>))}
                                </select>
                                <input type="number" value={quantity} onChange={e => setQuantity(e.target.value === '' ? '' : parseInt(e.target.value, 10))} className="w-20 px-3 py-2 bg-gray-700 border border-gray-600 rounded-lg text-center" min="1"/>
                                <button onClick={handleAddFish} className="px-4 py-2 bg-blue-600 text-white font-semibold rounded-lg hover:bg-blue-700 shadow"><PlusIcon/></button>
                            </div>
                        </div>

                        <div className="p-4 border border-gray-700 rounded-lg bg-gray-800/50">
                            <h3 className="font-semibold text-gray-200 mb-2">Add a Custom Fish</h3>
                            <div className="grid grid-cols-1 sm:grid-cols-2 gap-2">
                                <input type="text" placeholder="Fish Name" value={customFishName} onChange={e => setCustomFishName(e.target.value)} className="px-3 py-2 bg-gray-700 border border-gray-600 rounded-lg"/>
                                <input type="number" placeholder="Length (in)" value={customFishLength} onChange={e => setCustomFishLength(e.target.value)} className="px-3 py-2 bg-gray-700 border border-gray-600 rounded-lg"/>
                                <input type="number" placeholder="Qty" value={customFishQuantity} onChange={e => setCustomFishQuantity(e.target.value === '' ? '' : parseInt(e.target.value, 10))} className="px-3 py-2 bg-gray-700 border border-gray-600 rounded-lg text-center" min="1"/>
                                <button onClick={handleAddCustomFish} className="px-4 py-2 bg-yellow-500 text-gray-900 font-semibold rounded-lg hover:bg-yellow-600 shadow flex items-center justify-center gap-2"><PlusIcon/> Add Custom</button>
                            </div>
                        </div>
                    </div>

                    {/* Right Column: Results & Fish List */}
                    <div className="flex flex-col space-y-4">
                        <div className="bg-blue-900/20 p-6 rounded-lg text-center border-2 border-blue-500/30">
                            <h2 className="text-xl font-bold text-gray-100 mb-4">Stocking Results</h2>
                            <div className="grid grid-cols-2 gap-4">
                                <div>
                                    <p className="text-gray-400">Total Fish Inches</p>
                                    <p className="text-3xl font-bold text-blue-400">{totalInches.toFixed(1)}"</p>
                                </div>
                                <div>
                                    <p className="text-gray-400">Recommended Max</p>
                                    <p className="text-3xl font-semibold text-gray-200">{tankSize || 0}"</p>
                                </div>
                            </div>
                            <div className="w-full mt-4">
                                <div className="flex justify-between items-center mb-1">
                                    <span className={`font-bold text-lg ${stockingInfo.textColor}`}>{stockingInfo.label}</span>
                                    <span className="text-sm font-medium text-gray-300">{stockingLevel.toFixed(0)}%</span>
                                </div>
                                <div className="w-full bg-gray-700 rounded-full h-4"><div className={`h-4 rounded-full ${stockingInfo.color} transition-all duration-500`} style={{ width: `${Math.min(stockingLevel, 150)}%` }}></div></div>
                            </div>
                        </div>

                        <div className="bg-gray-900/50 p-4 rounded-lg h-48 overflow-y-auto border border-gray-700">
                            <h3 className="font-semibold text-gray-200 mb-2">Your Fish ({totalFishCount})</h3>
                            {addedFish.length === 0 ? (<p className="text-sm text-gray-500 text-center mt-8">Add fish to see them here!</p>) : (
                                <ul className="space-y-2">
                                    {addedFish.map((fish) => (
                                        <li key={fish.id} className="flex justify-between items-center bg-gray-700 p-2 rounded-md shadow-sm">
                                            <span className="text-gray-200 font-medium">{fish.name} <span className="font-normal text-gray-400">x{fish.quantity}</span></span>
                                            <div className="flex items-center space-x-2">
                                                <span className="text-sm text-gray-400">{fish.length}" each</span>
                                                <button onClick={() => handleRemoveFishGroup(fish.id)} className="text-red-500 hover:text-red-400 p-1 rounded-full hover:bg-red-500/10"><TrashIcon /></button>
                                            </div>
                                        </li>
                                    ))}
                                </ul>
                            )}
                        </div>
                         <p className="text-xs text-gray-500 text-center">Disclaimer: This is a general guideline. Filtration, fish temperament, and tank shape are also important factors.</p>
                    </div>
                </div>
            </div>
        </div>
    );
}
