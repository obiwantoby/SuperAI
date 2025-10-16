var superAILoaded;

function superAIPersonality() {
  if (superAILoaded) {
    return;
  }
  
  superAILoaded = true;
  
  try {
    var superUber = {
      name: "SuperAI",
      display_name: "SuperAI",
      ai_path: "/pa/ai_super/super_uber",
      metal_drain_check: 0.54,
      energy_drain_check: 0.72,
      metal_demand_check: 0.8,
      energy_demand_check: 0.8,
      micro_type: 2,
      go_for_the_kill: true,
      priority_scout_metal_spots: true,
      enable_commander_danger_responses: true,
      neural_data_mod: 1,
      adv_eco_mod: 1,
      adv_eco_mod_alone: 0,
      personality_tags: ["queller"],
      min_basic_fabbers: 3,
      min_advanced_fabbers: 1
    };
    
    model.aiPersonalities().SuperAI = superUber;
    model.aiPersonalities.valueHasMutated();
    
  } catch (e) {
    console.error("SuperAI error:", e);
    console.error(JSON.stringify(e));
  }
}

superAIPersonality();
