const express = require('express');
const app     = express();

app.use(express.json());
app.set('json spaces', 2);

// Define /builds handler
app.post('/builds', (req, res)=>{
    // Define request body
    const body = req.body

    console.log("POST request received to /builds", body)

    // Define variable for working with JSON body
    const builds = req.body.jobs[ 'Build base AMI' ].Builds

    // Sort objects by build date to determine latest build
    latestBuild = builds.sort((a, b) => (a.build_date > b.build_date) ? -1 : 1)[0]

    // Split the 'output' key on whitespace characters in order to return the required data
    latestBuildOutput = latestBuild['output'].split(" ")

    // Add the 'ami_id' and 'commit_hash' keys to the object
    latestBuild.ami_id      = latestBuildOutput[2]
    latestBuild.commit_hash = latestBuildOutput[3]

    // Craft the response object
    const latest = {
      build_date : latestBuild.build_date,
      ami_id     : latestBuild.ami_id,
      commit_hash: latestBuild.commit_hash
    }

    // Return the latest build object
    console.log({latest})
    res.json({latest})
  })
  
app.listen(8080, () => console.log('Server listening on port 8080'));
