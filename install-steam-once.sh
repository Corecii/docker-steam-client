echo "INSTALLING STEAM..."

steam -silent &

echo "STEAM IS RUNNING"
echo "THIS WILL TAKE A WHILE"

# Wait for steam to finish extracting and start
until pids=$(pidof steamwebhelper)
do   
    sleep 1
done

echo "STEAM DONE UPDATING, KILLING STEAM"

pkill steam

echo "KILL DONE. DOCKER WILL TAKE A WHILE TO SAVE THESE CHANGES..."