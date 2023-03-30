class RobotController < ApplicationController
   
    skip_before_action :verify_authenticity_token 
    def create
        commands=params[:commands]
        robot=Robot.new(x_pos:nil, y_pos:nil, direction:nil)

        commands.each do |command|
          case command
          when /^PLACE (\d+), (\d+), (NORTH|EAST|SOUTH|WEST)$/
            robot.x_pos=$1.to_i
            robot.y_pos=$2.to_i
            robot.direction=$3
          when "MOVE"
            case robot.direction
            when "NORTH"
                robot.y_pos+= 1 if robot.y_pos < 4
            when "EAST"
                robot.x_pos+= 1 if robot.x_pos < 4
            when "SOUTH"
                robot.y_pos-= 1 if robot.y_pos > 0
            when "WEST"
                robot.x_pos-= 1 if robot.x_pos > 0  
            end

          when "LEFT"
            case robot.direction
            when "NORTH"
                robot.direction="WEST"
            when "EAST"
                robot.direction="NORTH"
            when "SOUTH"
                robot.direction="EAST"
            when "WEST"
                robot.direction="SOUTH"
            end 

          when "RIGHT"
            case robot.direction
            when "NORTH"
            robot.direction = "EAST"
            when "EAST"
            robot.direction = "SOUTH"
            when "SOUTH"
            robot.direction = "WEST"
            when "WEST"
            robot.direction = "NORTH"
            end

          when "REPORT"
            render json: {location: [robot.x_pos, robot.y_pos, robot.direction]}
            return
          end
        end
        render json: {location: [robot.x_pos, robot.y_pos, robot.direction]}
    end
end
